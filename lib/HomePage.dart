import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        // leading: Padding(
        //   padding: const EdgeInsets.only(left: 8.0),
        //   child: Row(
        //     children: [
        //       const Text(
        //         'EN',
        //         style: TextStyle(color: Colors.white),
        //       )
        //     ],
        //   ),
        // ),
        // actions: [
        //   Builder(
        //     builder: (context) => IconButton(
        //       icon: const Icon(Icons.more_horiz),
        //       iconSize: 30,
        //       color: Colors.white,
        //       onPressed: () => Scaffold.of(context).openEndDrawer(),
        //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        //     ),
        //   ),
        // ],
      ),
      bottomNavigationBar: _buildBottomAppBar(),
      floatingActionButton: _buildFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Expanded(
            //     child: Container(
            //         decoration: BoxDecoration(
            //             borderRadius: const BorderRadius.only(
            //                 topLeft: Radius.circular(20),
            //                 topRight: Radius.circular(20)),
            //             color: Colors.white),
            //         child: ClipRRect(
            //             borderRadius: const BorderRadius.only(
            //                 topLeft: Radius.circular(20),
            //                 topRight: Radius.circular(20)),
            //             child: Center(
            //               child: Text("abc"),
            //             )))),
          ],
        ),
      ),
    );
  }

  _buildFab() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        width: 65,
        height: 65,
        child: FloatingActionButton(
          onPressed: () {},
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
              onPressed: () {},
            ),
            const Spacer(),
            IconButton(
              tooltip: 'Search',
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Favorite',
              icon: const Icon(Icons.favorite),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
