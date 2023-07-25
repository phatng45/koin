import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:koin/BlockDetailsPage.dart';
import 'package:koin/api/ApiServices.dart';
import 'package:koin/main.dart';

import 'LoginPage.dart';

class BlocksPage extends StatefulWidget {
  const BlocksPage({Key? key}) : super(key: key);

  @override
  State<BlocksPage> createState() => _BlocksPageState();
}

class _BlocksPageState extends State<BlocksPage> {
  List<dynamic>? blocks;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    getBlocks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      marginHorizontal: 10,
      padding: 5,
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.all(5),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 20, 0, 20),
                          child: Text(
                            "Blocks",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontSize: 25,
                                ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      child: ListView.builder(
                          controller: scrollController,
                          shrinkWrap: true,
                          itemCount: blocks?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            int reversedIndex =
                                (blocks?.length ?? 0) - 1 - index;
                            return _block(
                                reversedIndex.toString(),
                                blocks?[reversedIndex]['hash'],
                                blocks?[reversedIndex]['timeStamp'] ==
                                        'GenesisTime'
                                    ? 'Genesis Time'
                                    : DateFormat('y MMM d – kk:mm:ss').format(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            blocks?[reversedIndex]
                                                ['timeStamp'])));
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _block(String index, String blockId, String time) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Container(
        height: 60,
        width: double.maxFinite,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.white12,
                elevation: 0),
            onPressed: () => MyApp.to(context, BlockDetailsPage(id: index)),
            child: Align(
              alignment: const Alignment(-1, -1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    blockId,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 15),
                  ),
                  Text(
                    time,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: 15, color: Colors.white38),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  void getBlocks() async {
    var response = await ApiServices.GetBlocks();
    setState(() {
      blocks = response;
    });
  }
}
