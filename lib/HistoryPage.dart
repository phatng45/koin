import 'package:flutter/material.dart';

import 'LoginPage.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MyContainer(
          padding: 0,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(5),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 20, 0, 20),
                        child: Text(
                          "History",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontSize: 25,
                                  ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  _transaction("sdasfasf", "sadasfasf", "asdasfasfas"),
                  _transaction("sdasfasf", "sadasfasf", "asdasfasfas"),
                  _transaction("sdasfasf", "sadasfasf", "asdasfasfas"),
                  _transaction("sdasfasf", "sadasfasf", "asdasfasfas"),
                  _transaction("sdasfasf", "sadasfasf", "asdasfasfas"),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  _transaction(String from, String to, String transactionId) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Divider(),
          Row(
            children: <Widget>[
              Text(from),
              Icon(Icons.arrow_right_alt_rounded),
              Text(to),
            ],
          ),
          Text('ID: $transactionId')
        ],
      ),
    );
  }
}
