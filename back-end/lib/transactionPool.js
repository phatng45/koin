const Transaction = require("./transaction")

class TransactionPool {
    constructor() {
        this.transactions = [];
    };

    validTransactions() {
        return this.transactions.filter((tx)=>{
            const totalOutputAmount = tx.outputs.reduce((s, output) => {
                return s + output.amount;
            }, 0);
            
            if(totalOutputAmount != tx.input.amount) {
                return;
            }
            
            if(!Transaction.verifyTransaction(tx)) { 
                return;
            }

            return tx;
        })
    };

    addTransaction(transaction) {
        this.transactions.push(transaction);
    };

    updateOrAddTransaction(transaction){
        let transactionWithID = this.transactions.find(t => t.id === transaction.id);

        if(transactionWithID){
            this.transactions[this.transactions.indexOf(transactionWithID)] = transaction;
        }else{
            this.transactions.push(transaction);
        }

    }

    clear() {
        this.transactions = [];
    };
};

module.exports = TransactionPool;