import 'package:flutter/material.dart';

class TabScreen extends StatelessWidget {
  final String title;

  const TabScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: TextStyle(fontSize: 90),
      ),
    );
  }
}