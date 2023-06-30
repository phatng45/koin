import 'package:flutter/material.dart';
import 'package:koin/LoginPage.dart';

class CreateWalletPage extends StatelessWidget {
  const CreateWalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroPage(
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 0, 20),
                child: Text(
                  "Hello Friend!",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 25,
                      ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  text: "You just created a new Wallet. Use the ",
                  children: [
                    TextSpan(
                        text: "Private Key",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: " to login and "),
                    TextSpan(
                        text: "Public Key",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: " for the transactions.")
                  ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: MyContainer(
                child: TextField(
              enabled: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Private Key",
                isDense: true,
              ),
            )),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: MyContainer(
                child: TextField(
              enabled: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Public Key",
                isDense: true,
              ),
            )),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: TextButton(onPressed: () {}, child: Text("Login")))
        ],
      ),
    );
  }
}
