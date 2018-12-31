import 'package:flutter/material.dart';
import 'package:habit/a_ui/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Have It',
      theme:
          ThemeData(primarySwatch: Colors.grey, accentColor: Colors.deepPurple),
      home: PageHome(),
    );
  }
}
