const Block = require('./block');

class BlockChain {
    constructor() {
        this.chain = [Block.genesis()];
        this.miningReward = 10;
    };

    addBlock(data) {
        const lastBlock = this.getLastBlock();
        const block = new Block(Date.now(), lastBlock.hash, '', data, 0, lastBlock.difficulty);
        block.mineBLock(block.difficulty);
        this.chain.push(block);
        return block;
    };

    getLastBlock() {
        return this.chain[this.chain.length - 1];
    };

    isValidChain() {
        if(JSON.stringify(this.chain[0])!== JSON.stringify(Block.genesis())) return false;

        for(let i = 1; i < this.chain.length; i++) {
            if((this.chain[i].previousHash !== this.chain[i-1].hash) || (this.chain[i].hash !== this.chain[i].doHash())) {
                return false;
            }
        };

        return true;
    }

    getBlock(index) {
        if (index < 0 || index > this.chain.length - 1) {return {}};
        return this.chain[index];
    }
};

module.exports = BlockChain;