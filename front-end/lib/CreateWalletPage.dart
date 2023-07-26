import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:koin/LoginPage.dart';
import 'package:koin/api/ApiServices.dart';
import 'package:koin/main.dart';

class CreateWalletPage extends StatefulWidget {
  const CreateWalletPage({Key? key}) : super(key: key);

  @override
  State<CreateWalletPage> createState() => _CreateWalletPageState();
}

class _CreateWalletPageState extends State<CreateWalletPage> {
  @override
  void initState() {
    super.initState();
    getNewKeys();
  }

  void getNewKeys() async {
    var data = await ApiServices.SignUp();

    setState(() {
      privateKeyTextController.text = data['privateKey'];
      publicTextController.text = data['publicKey'];
    });
  }

  TextEditingController privateKeyTextController = TextEditingController();
  TextEditingController publicTextController = TextEditingController();

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
              controller: privateKeyTextController,
              readOnly: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Private key',
                  isDense: true,
                  labelStyle: TextStyle(color: Colors.white),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.copy, color: Colors.white),
                    onPressed: () async {
                      await Clipboard.setData(ClipboardData(text: privateKeyTextController.text));
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Copied to clipboard')));
                    },
                  )),
            )),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: MyContainer(
                child: TextField(
              controller: publicTextController,
              readOnly: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Public key',
                  isDense: true,
                  labelStyle: TextStyle(color: Colors.white),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.copy, color: Colors.white),
                    onPressed: () async {
                      await Clipboard.setData(ClipboardData(text: publicTextController.text));
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Copied to clipboard')));
                    },
                  )),
            )),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: TextButton(
                  onPressed: () => MyApp.to(context, LoginPage()),
                  child: Text("Back to Login")))
        ],
      ),
    );
  }
}
