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
          width: 1500,
          height: 2500,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/gamebgm2.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SizedBox(
            width: 1500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    "Choose Your Mode",
                    style:
                        TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                  ),
                  padding: EdgeInsets.fromLTRB(0.0, 90.0, 0.0, 30.0),
                ),
                Container(
                  width: 200,
                  height: 80,
                  child: ElevatedButton(
                    child: Text("Single Player"),
                    onPressed: null,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                ),
                Container(
                  width: 200,
                  height: 80,
                  child: ElevatedButton(
                    child: Text("Double Player"),
                    onPressed: null,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
