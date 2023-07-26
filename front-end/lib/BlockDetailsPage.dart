import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:koin/api/ApiServices.dart';

import 'LoginPage.dart';

class BlockDetailsPage extends StatefulWidget {
  BlockDetailsPage({Key? key, required this.id}) : super(key: key);

  String id;

  @override
  State<BlockDetailsPage> createState() => _BlockDetailsPageState();
}

class _BlockDetailsPageState extends State<BlockDetailsPage> {
  @override
  void initState() {
    super.initState();

    getBlockDetails();
  }

  void getBlockDetails() async {
    var response = await ApiServices.GetBlockDetails(widget.id);
    setState(() {
      hash = response['hash'].toString();
      timeStamp = DateFormat('y MMM d – kk:mm:ss')
          .format(DateTime.fromMillisecondsSinceEpoch(response['timeStamp']));
      nonce = response['nonce'].toString();
      difficulty = response['difficulty'].toString();
      previousHash = response['previousHash'].toString();

      List<dynamic> data = response['data'] as List;
      transactions = <Transaction>[];

      transactions = data
          .map((d) => Transaction(
                d['id'],
                d['input']['address'],
                d['outputs'][0]['address'].toString(),
                d['outputs'][0]['amount'].toString(),
              ))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  String? hash;
  String? timeStamp;
  String? previousHash;
  String? nonce;
  String? difficulty;
  List<Transaction>? transactions;

  _buildBody() {
    return MyContainer(
      padding: 0,
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(5),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Text(
                  "Block Details",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 25,
                      ),
                  textAlign: TextAlign.left,
                ),
              ),
              _text(hash ?? 'N/A'),
              Divider(),
              SizedBox(
                height: 5,
              ),
              _iconWithText(Icons.access_time, "Time: ${timeStamp ?? 'N/A'}"),
              SizedBox(
                height: 5,
              ),
              _iconWithText(
                  Icons.view_agenda_rounded, "Nonce: ${nonce ?? 'N/A'}"),
              SizedBox(
                height: 5,
              ),
              _iconWithText(Icons.signal_cellular_alt,
                  "Difficulty: ${difficulty ?? 'N/A'}"),
              Divider(),
              _text("Previous Hash:\n${previousHash ?? 'N/A'}"),
              Divider(),
              _text("Transactions: "),
              _buildTransactionDetails(),
              SizedBox(
                height: 5,
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Back"))),
            ],
          ),
        ),
      ),
    );
  }

  Text _text(String text, {bool ellipsis = false, Color color = Colors.white}) {
    return Text(
      text,
      overflow: ellipsis ? TextOverflow.ellipsis : TextOverflow.visible,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(color: color),
    );
  }

  Row _iconWithText(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
        )
      ],
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
    );
  }

  _transactionDetails(Transaction? t, int? index) {
    if (t == null) return SizedBox.shrink();

    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      decoration: BoxDecoration(
        color: (index ?? 0).isEven
            ? Colors.grey.withAlpha(25)
            : Colors.grey.withAlpha(50),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          t.id ?? 'N/A',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w600, fontSize: 13),
        ),
        const SizedBox(height: 10,),
        _text('From: ${t.from ?? 'N/A'}',
            ellipsis: true, color: Colors.white38),
        _text('To: ${t.to ?? 'N/A'}', ellipsis: true, color: Colors.white38),
      ]),
    );
  }

  _buildTransactionDetails() {
    List<Widget> list = <Widget>[];
    for (var i = 0; i < (transactions?.length ?? 0); i++) {
      list.add(_transactionDetails(transactions?[i], i));
    }
    return Column(children: list);
  }
}

class Transaction {
  String? id;
  String? from;
  String? to;
  String? amount;

  Transaction(this.id, this.from, this.to, this.amount);
}
