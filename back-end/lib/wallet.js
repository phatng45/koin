const { json } = require("express");
const Transaction = require('./transaction');
const EC = require('elliptic').ec;
const ec = new EC('secp256k1');

class Wallet {
    constructor(ecKeyPair) {

        if (ecKeyPair !== undefined) {
            this.keyPair = ecKeyPair;
        } else {
            this.keyPair = ec.genKeyPair();
        }
        this.publicKey = this.getPublicKey();
        this.balance = 0;
    }

    getPublicKey(){
        return this.keyPair.getPublic().encode('hex');
    }

    getPrivate() {
        return this.keyPair.getPrivate().toString('hex');
    }

    getBalance(blockchain) {
        let balance = 0;
        let transactions = [];

        blockchain.chain.forEach(block => block.data.forEach(tx => {
            transactions.push(tx);
        }));

        for (let tx of transactions) {
            let minus = 0;

            if (tx.outputs.length === 1 && tx.outputs[0].address === this.publicKey) {
                balance += tx.outputs[0].amount;
            } else {
                for (let i = 0; i < tx.outputs.length; i++) {
                    if (tx.outputs[i].address === this.publicKey && i > 0) {
                        balance += tx.outputs[i].amount;
                    }

                    if (tx.outputs[0].address === this.publicKey && i !== 0) {
                        minus += tx.outputs[i].amount;
                    }
                }
            }
            
            balance -= minus;
        }
        this.balance = balance;
        return balance;
    }

    sign(dataHash) {
        return this.keyPair.sign(dataHash);
    }

    createTransaction(toAddress, amount, blockchain, transactionPool){
        this.balance = this.getBalance(blockchain);

        if(this.balance < amount) {
            console.log(`Balance not enough!!!`);
            return;
        }
        
        let tx = transactionPool.transactions.find(t => t.input.address === this.publicKey);
        if(tx) {
            tx.update(this, toAddress, amount);
        } else {
            tx = new Transaction(this, toAddress, amount);
            transactionPool.addTransaction(tx);
        }

        return tx;
    }

    getHistory(blockchain) {
        let transactions = [];

        blockchain.chain.forEach(block => block.data.forEach(tx => {
            if (tx.input.address === this.publicKey) {
                transactions.push(tx);
            } else {
            for(let o of tx.outputs) {
                if(o.address === this.publicKey)
                transactions.push(tx)
                break;
            }
        }
        }));
        return transactions;
    }
    
    static blockchainWallet(){
        const blockchainWallet = new this();
        blockchainWallet.address = 'BlockchainWallet';
        return blockchainWallet;
    }
}

module.exports = Wallet;