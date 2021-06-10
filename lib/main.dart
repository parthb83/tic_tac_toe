import 'package:flutter/material.dart';

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
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Let's Play Tic Tac Toe!!!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ));
  }
}
