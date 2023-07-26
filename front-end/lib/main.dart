import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koin/LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static to(BuildContext context, Widget page) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Koin',
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromRGBO(30, 30, 30, 1),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8.0), // Set the border radius
                ),
              ),
              textStyle: MaterialStateProperty.all<TextStyle>(
                TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          textTheme: GoogleFonts.robotoTextTheme().copyWith(
              titleLarge:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
              titleMedium:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
              displayLarge: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white),
              headlineSmall: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              displaySmall: TextStyle(color: Colors.white)),
          inputDecorationTheme:
              InputDecorationTheme(hintStyle: TextStyle(color: Colors.white)),
          dividerTheme: DividerThemeData(thickness: 1.2),
          iconTheme: IconThemeData(color: Colors.white),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.orange, // Set the FAB color
              elevation: 0,
              iconSize: 30,
              foregroundColor: Colors.black),
          appBarTheme: AppBarTheme(foregroundColor: Colors.white)),
      home: LoginPage(),
    );
  }
}
