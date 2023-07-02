import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koin/HistoryPage.dart';
import 'package:koin/LoginPage.dart';
import 'package:koin/WalletPage.dart';
import 'package:koin/main.dart';

import 'BlocksPage.dart';
import 'TabScreen.dart';
import 'TransferPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tabIndex = 0;

  List<Widget> _tabs = [
    // Replace these with your own tab views
    WalletPage(),
    TabScreen(title: 'Tab 1'),
    // TabScreen(title: 'Tab 2'),
    TransferPage(),
    HistoryPage(),
    BlocksPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      bottomNavigationBar: _buildBottomAppBar(),
      floatingActionButton: _buildFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(child: _tabs[_tabIndex]),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      centerTitle: true,
      title: Text(
        "Koin",
        style: GoogleFonts.righteous(
            fontSize: 30, fontWeight: FontWeight.w500, color: Colors.white),
      ),
      elevation: 0.0,
      leadingWidth: 120,
    );
  }

  _buildFab() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        width: 65,
        height: 65,
        child: FloatingActionButton(
          onPressed: () => setState(() => _tabIndex = 0),
          tooltip: 'Create',
          child: const Icon(Icons.wallet),
        ),
      ),
    );
  }

  _buildBottomAppBar() {
    return BottomAppBar(
      height: 60,
      shape: CircularNotchedRectangle(),
      color: Colors.white.withAlpha(70),
      elevation: 0,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: <Widget>[
            PopupMenuButton(
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onSelected: (value) => {
                if (value == "Logout") {MyApp.to(context, LoginPage())}
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: "Logout",
                  child: ListTile(
                      leading: Icon(Icons.logout, color: Colors.red),
                      title: Text(
                        'Logout',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.red),
                      )),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(
                Icons.sync_alt_outlined,
                color: Colors.white,
              ),
              onPressed: () => setState(() => _tabIndex = 2),
            ),
            IconButton(
              icon: const Icon(
                Icons.history,
                color: Colors.white,
              ),
              onPressed: () => setState(() => _tabIndex = 3),
            ),
            IconButton(
              icon: const Icon(
                Icons.public,
                color: Colors.white,
              ),
              onPressed: () => setState(() => _tabIndex = 4),
            ),
          ],
        ),
      ),
    );
  }
}
