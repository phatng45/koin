const crypto = require("crypto-js");

class Block {
    constructor(timeStamp, previousHash, hash, data, nonce, difficulty) {
        this.timeStamp = timeStamp;
        this.previousHash = previousHash;
        this.hash = this.doHash();
        this.data = data;
        this.nonce = nonce;
        this.difficulty = difficulty || 2;
    };

    doHash() {
        return crypto.SHA256(this.timeStamp + this.previousHash + JSON.stringify(this.data) + this.nonce + this.difficulty).toString();
    };

    static genesis() {
        return new this('GenesisTime', 'GenesisPreviousHash', 'GenesisHash', [], 0, 2);
    };

    mineBLock(difficulty) {
        while (this.hash.substring(0, difficulty) !== Array(difficulty + 1).join('0')) {
            this.nonce++;
            this.hash = this.doHash();
        }
    };
}

module.exports = Block;