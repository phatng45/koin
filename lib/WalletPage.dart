import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:koin/HomePage.dart';
import 'package:koin/LoginPage.dart';
import 'package:koin/api/ApiServices.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  int? balance;

  @override
  void initState() {
    getBalance();
    super.initState();
  }

  void getBalance() async {
    var response = await ApiServices.GetBalance();
    setState(() {
      balance = response['balance'];
    });
  }

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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Balance",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.visibility,
                            size: 30,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    (balance ?? 0).toString() + '\$',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: MyContainer(
            marginHorizontal: 0,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Private Key",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          HomePage.privateKey ?? 'N/A',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      IconButton(
                          onPressed: () async {
                            await Clipboard.setData(
                                ClipboardData(text: HomePage.privateKey ?? ''));
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Copied to clipboard')));
                          },
                          icon: Icon(Icons.copy))
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(),
                  Text(
                    "Public Key",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          HomePage.publicKey ?? 'N/A',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      IconButton(
                          onPressed: () async {
                            await Clipboard.setData(
                                ClipboardData(text: HomePage.publicKey ?? ''));
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Copied to clipboard')));
                          },
                          icon: Icon(Icons.copy))
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
