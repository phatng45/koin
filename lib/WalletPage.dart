import 'package:flutter/material.dart';
import 'package:koin/LoginPage.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
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
                    "8.88\$",
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
                          "sa32df1as23f1as65fasf45sadasf312asfas312f3asfasfas213fas2f1as32f1as3264asf32as1",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.copy))
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
                          "sa32df1as23f1as65fasf45sadasf312asfas312f3asfasfas213fas2f1as32f1as3264asf32as1",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.copy))
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
