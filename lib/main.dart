import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:koin/CreateWalletPage.dart';
import 'package:koin/HomePage.dart';

import 'LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Koin',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueGrey,
        // textTheme: TextTheme(
        //   labelLarge: TextStyle(
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        // useMaterial3: true,
        // buttonTheme: ButtonThemeData(
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(5.0), // Set the border radius
        //   ),
        // ),
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
        // fontFamily: GoogleFonts.roboto(color: Colors.grey[800]).fontFamily,
        textTheme: GoogleFonts.robotoTextTheme().copyWith(
          titleLarge: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.normal),
          displayLarge: TextStyle(color: Colors.grey[700]),
          bodyMedium: TextStyle(color: Colors.grey[700]),
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey),
      ),
      home: HomePage(),
    );
  }
}
