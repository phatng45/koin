import 'package:flutter/material.dart';
import 'package:koin/BlockDetailsPage.dart';
import 'package:koin/main.dart';

import 'LoginPage.dart';

class BlocksPage extends StatefulWidget {
  const BlocksPage({Key? key}) : super(key: key);

  @override
  State<BlocksPage> createState() => _BlocksPageState();
}

class _BlocksPageState extends State<BlocksPage> {
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
                          "Blocks",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontSize: 25,
                                  ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  _block("safasfsa"),
                  _block("safasfsa"),
                  _block("safasfsa"),
                  _block("safasfsa"),
                  _block("safasfsa"),
                  _block("safasfsa"),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  _block(String blockId) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Container(
        height: 60,
        width: double.maxFinite,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.grey,
                backgroundColor: Colors.blueGrey[50],
                elevation: 0),
            onPressed: () => MyApp.to(context, BlockDetailsPage(id: blockId)),
            child: Align(
              alignment: const Alignment(-1, 0),
              child: Text(
                blockId,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.grey[700]),
              ),
            )),
      ),
    );
  }
}
