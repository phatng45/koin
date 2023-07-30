const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');

const Blockchain = require('./lib/blockchain');
const Server = require('./server/Server');
const Wallet = require('./lib/wallet');
const TransactionPool = require('./lib/transactionPool');
const Miner = require('./lib/miner');

const HTTP_PORT = process.env.HTTP_PORT || 3000;
const app = express();

const EC = require('elliptic').ec;
const ec = new EC('secp256k1');

app.use(cors())

const bc = new Blockchain();
const tp = new TransactionPool();
var wallet = null;
const server = new Server(bc, tp);
var miner = null;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true
}));

app.post('/logIn', (req, res) => {
    wallet = new Wallet(ec.keyFromPrivate(req.body.privateKey));
    miner = new Miner(wallet, bc, tp, server);
    return res.json({
        "publicKey": wallet.publicKey,
        "privateKey": req.body.privateKey
    })
})

app.get('/signUp', (req, res) => {
    const wallet = ec.genKeyPair(); 
    return res.json({
        "publicKey": wallet.getPublic().encode('hex'),
        "privateKey": wallet.getPrivate().toString('hex')
    })
})

app.get('/logOut', (req, res) => {
    if(wallet === null) {return res.status(204).json({})};
    miner = null;
    wallet = null;
    res.status(200).json({})
})

//get all transactions
app.get('/transactions', (req, res) => {
    res.json(tp.transactions);
});

app.get('/balance', (req, res) => {
    if(wallet === null) {return res.status(204).json({})};
    res.json({ "balance": wallet.getBalance(bc) });
});

app.get('/history', (req, res) => {
    if(wallet === null) {return res.status(204).json({})};
    res.json( wallet.getHistory(bc) );
})

//mine blockchain and clears old transaction pool then broadcast new chain
app.get('/mine-transactions', (req, res) => {
    if(miner === null) {return res.status(204).json({})};
    const block = miner.mine();
    console.log(block);
    res.redirect('/blocks');
})

//perform transaction
app.post('/transact', (req, res) => {
    if(wallet === null) {return res.status(204).json({})};
    const { recipient, amount } = req.body;
    const transaction = wallet.createTransaction(recipient, amount, bc, tp);
    server.broadcastTransaction(transaction);
    res.redirect('/transactions');
});

//get the whole blockchain
app.get('/blocks', (req, res) => {
    res.json(bc.chain);
});

app.get('/blocks/:id', (req, res) => {
    res.json(bc.getBlock(req.params.id));
});

app.listen(HTTP_PORT, () => {
    console.log(`server started on port ${HTTP_PORT}`);
});

server.listen()