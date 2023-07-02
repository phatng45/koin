import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koin/CreateWalletPage.dart';
import 'package:koin/HomePage.dart';
import 'package:koin/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return IntroPage(
        child: Column(children: <Widget>[
      Row(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 0, 20),
            child: Text(
              "Welcome back!",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 25,
                  ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
      MyContainer(
          child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Your Private Key",
            icon: Icon(Icons.lock)),
      )),
      Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: ElevatedButton(
          onPressed: () => MyApp.to(context, HomePage()),
          child: Text("Login"),
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have a wallet?",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            TextButton(onPressed: () => MyApp.to(context, CreateWalletPage()), child: Text("Create one!")),
          ],
        ),
      ),
    ]));
  }
}

class IntroPage extends StatelessWidget {
  IntroPage({
    super.key,
    this.child,
  });

  Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: <Widget>[
      Padding(
        padding: EdgeInsets.fromLTRB(0, 160, 0, 20),
        child: Text(
          "Koin",
          style: GoogleFonts.righteous(
              fontSize: 50, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      MyContainer(
        child: child ?? SizedBox.shrink(),
      )
    ])));
  }
}

class MyContainer extends StatelessWidget {
  MyContainer(
      {super.key, required this.child, this.padding, this.marginHorizontal});

  final Widget child;
  double? padding;
  double? marginHorizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: marginHorizontal ?? 10),
        padding: EdgeInsets.all(padding ?? 5),
        decoration: BoxDecoration(
          color: Colors.white12,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Color(0x44000000),
              offset: Offset(0, 0),
            )
          ],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.white12, // Color(0x98E4E4E4),
          ),
        ),
        child: child);
  }
}
