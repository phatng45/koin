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
  bool isHiding = false;

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
                          onPressed: () => setState(() {
                                isHiding = !isHiding;
                              }),
                          icon: Icon(
                            isHiding
                                ? Icons.visibility_off_outlined
                                : Icons.visibility,
                            size: 30,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    isHiding ? '***\$' : (balance ?? 0).toString() + '\$',
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
                          isHiding
                              ? '***********************************'
                              : HomePage.privateKey ?? 'N/A',
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
        ),
        Container(
            width: 120,
            height: 50,
            child: ElevatedButton(
                onPressed: mine,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.currency_exchange_rounded),
                    Text(
                      'Mine',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontSize: 20, color: Colors.black),
                    ),
                  ],
                )))
      ],
    );
  }

  void mine() async {
    await ApiServices.Mine();
    getBalance();
  }
}
