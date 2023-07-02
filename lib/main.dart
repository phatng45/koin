import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koin/HomePage.dart';
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
        scaffoldBackgroundColor: Colors.blueGrey,
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
              TextStyle(color: Colors.grey[500], fontWeight: FontWeight.normal),
          titleMedium:
              TextStyle(color: Colors.grey[500], fontWeight: FontWeight.normal),
          displayLarge: TextStyle(color: Colors.grey[700]),
          bodyMedium: TextStyle(color: Colors.grey[700]),
          headlineSmall: TextStyle(
              color: Colors.grey[500],
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        dividerTheme: DividerThemeData(thickness: 1.2),
        iconTheme: IconThemeData(color: Colors.grey[500]),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.white.withAlpha(50), // Set the FAB color
          elevation: 0,
          iconSize: 30,
        ),
      ),
      home: LoginPage(),
    );
  }
}
