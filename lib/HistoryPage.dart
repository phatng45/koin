import 'package:flutter/material.dart';
import 'package:koin/api/ApiServices.dart';

import 'LoginPage.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    getHistory();
    super.initState();
  }

  List<dynamic>? history;

  void getHistory() async {
    List<dynamic> response = await ApiServices.GetHistory() as List;

    setState(() {
      history = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                    _buildHistory()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _transaction(String from, String to, String transactionId, String amount) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Divider(),
          Row(
            children: <Widget>[
              Text(
                from,
                overflow: TextOverflow.ellipsis,
              ),
              Icon(Icons.arrow_right_alt_rounded),
              Expanded(
                child: Text(
                  to,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Text('ID: $transactionId'),
          SizedBox(
            height: 3,
          ),
          Text('Amount $amount')
        ],
      ),
    );
  }

  _buildHistory() {
    List<Widget> list = <Widget>[];
    for (var i = 0; i < (history?.length ?? 0); i++) {
      list.add(_transaction(
        history?[i]['input']['address'] ?? 'N/A',
        history?[i]['outputs'][0]['address'] ?? 'N/A',
        history?[i]['id'] ?? 'N/A',
        (history?[i]['outputs'][0]['amount'] ?? '0').toString(),
      ));
    }
    return Column(children: list);
  }
}
