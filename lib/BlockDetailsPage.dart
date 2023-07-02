import 'package:flutter/material.dart';
import 'package:koin/main.dart';

import 'LoginPage.dart';

class BlockDetailsPage extends StatefulWidget {
  BlockDetailsPage({Key? key, required this.id}) : super(key: key);

  String id;

  @override
  State<BlockDetailsPage> createState() => _BlockDetailsPageState();
}

class _BlockDetailsPageState extends State<BlockDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  late String? id = widget.id;
  String? timeStamp;
  String? previousHash;
  String? nonce;
  String? difficulty;
  List<Transaction>? transactions = [
    Transaction(),
    Transaction(),
    Transaction(),
    Transaction()
  ];

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
              _text(widget.id),
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
              _text("Previous Hash: ${previousHash ?? 'N/A'}"),
              Divider(),
              _text("Transactions: "),
              _buildTransactionDetails(),
              SizedBox(
                height: 5,
              ),
              Center(
                  child: ElevatedButton(onPressed: () => Navigator.pop(context), child: Text("Back"))),
            ],
          ),
        ),
      ),
    );
  }

  Text _text(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium,
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
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _text(t.from ?? 'N/A'),
            Icon(Icons.arrow_right_alt_rounded),
            _text(t.to ?? 'N/A'),
          ],
        ),
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
}
