import 'package:flutter/material.dart';
import 'package:koin/api/ApiServices.dart';

import 'LoginPage.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  TextEditingController publicKeyTextController = TextEditingController();
  TextEditingController amountTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MyContainer(
          padding: 0,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(5),
            // margin: EdgeInsets.all(20),
            // decoration: BoxDecoration(
            //     color: Colors.white.withAlpha(50),
            //     borderRadius: BorderRadius.circular(10)),
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
                          "Transfer",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontSize: 25,
                                  ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyContainer(
                      marginHorizontal: 0,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: TextField(
                          controller: publicKeyTextController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: "Public Key",
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  MyContainer(
                      marginHorizontal: 0,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: TextField(
                          controller: amountTextController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: "Amount",
                              labelStyle: TextStyle(color: Colors.white)),
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 20, 10),
                        child: ElevatedButton(
                          onPressed: transfer,
                          child: Text("Transfer"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void transfer() async {
    var response = await ApiServices.Transfer(
        publicKeyTextController.text, amountTextController.text);
    if (response != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Transferred successfully')));
    }else{
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Transaction failed')));
    }
  }
}
