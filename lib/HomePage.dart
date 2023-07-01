import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koin/WalletPage.dart';

import 'TabScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tabIndex = 0;
  final List<Widget> _tabs = [
    // Replace these with your own tab views
    WalletPage(),
    TabScreen(title: 'Tab 1'),
    TabScreen(title: 'Tab 2'),
    TabScreen(title: 'Tab 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text(
          "Koin",
          style: GoogleFonts.righteous(
              fontSize: 30, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        elevation: 0.0,
        leadingWidth: 120,
      ),
      bottomNavigationBar: _buildBottomAppBar(),
      floatingActionButton: _buildFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(child: _tabs[_tabIndex]),
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
      color: Colors.white.withAlpha(30),
      elevation: 0,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: <Widget>[
            IconButton(
              tooltip: 'Open navigation menu',
              icon: const Icon(Icons.menu),
              onPressed: () => setState(() => _tabIndex = 1),
            ),
            const Spacer(),
            IconButton(
              tooltip: 'Search',
              icon: const Icon(Icons.search),
              onPressed: () => setState(() => _tabIndex = 2),
            ),
            IconButton(
              tooltip: 'Favorite',
              icon: const Icon(Icons.favorite),
              onPressed: () => setState(() => _tabIndex = 3),
            ),
          ],
        ),
      ),
    );
  }
}
