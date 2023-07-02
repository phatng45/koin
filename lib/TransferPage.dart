import 'package:flutter/material.dart';

import 'LoginPage.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
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
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Public Key",
                          ),
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
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Amount",
                          ),
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 20, 10),
                        child: ElevatedButton(
                          onPressed: () {},
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
}
