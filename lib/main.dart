import 'package:flutter/material.dart';

import './home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.black),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Tic Tac Toe"),
        ),
        body: Container(
          width: 1500,
          height: 2500,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/gamebgm2.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: HomePage(),
        ),
      ),
    );
  }
}
