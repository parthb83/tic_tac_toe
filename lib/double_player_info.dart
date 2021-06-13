import 'package:flutter/material.dart';

import './double_player.dart';

class DoublePlayerInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DoublePlayerInfo();
  }
}

class _DoublePlayerInfo extends State<DoublePlayerInfo> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String player1Name = "";
  String player2Name = "";

  void _submit() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DoublePlayer(player1Name, player2Name),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.black),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Player Name"),
        ),
        body: Container(
          width: 1500,
          height: 2500,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/gamebgm3.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Player-1",
                    ),
                    onFieldSubmitted: (value) {
                      setState(() {
                        this.player1Name = value;
                      });
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Player-2",
                    ),
                    onFieldSubmitted: (value) {
                      setState(() {
                        this.player2Name = value;
                      });
                    },
                  ),
                ),
                Container(
                  width: 100.0,
                  height: 100.0,
                  padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                  child: ElevatedButton(
                    onPressed: _submit,
                    child: Text(
                      "Ok",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 30.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Tip: Press ",
                          style: TextStyle(fontSize: 16.0),
                        ),
                        WidgetSpan(
                          child: Icon(Icons.check, size: 20),
                        ),
                        TextSpan(
                          text: " icon on keyboard to save your name.",
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
