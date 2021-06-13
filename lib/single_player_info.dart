import 'package:flutter/material.dart';

import './single_player.dart';

class SinglePlayerInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SinglePlayerInfoState();
  }
}

class _SinglePlayerInfoState extends State<SinglePlayerInfo> {
  String humanPlayer = "O";
  String aiPlayer = "X";
  bool isFirst = true;
  bool isPressed1 = false;
  bool isPressed2 = false;
  bool isPressed3 = false;
  bool isPressed4 = false;

  void handle() {}

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
          child: SizedBox(
            width: 1500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    "Choose Your Shape",
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                  padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 30.0),
                ),
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: isPressed1 ? Colors.blue : Colors.amber,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          humanPlayer = "X";
                          aiPlayer = "O";
                          isPressed1 = true;
                          if (isPressed2 == true) isPressed2 = false;
                        },
                      );
                    },
                    child: Text(
                      "X",
                    ),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: isPressed2 ? Colors.blue : Colors.amber,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          humanPlayer = "O";
                          aiPlayer = "X";
                          isPressed2 = true;
                          if (isPressed1 == true) isPressed1 = false;
                        },
                      );
                    },
                    child: Text(
                      "O",
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "Would you like to go first?",
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                  padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 30.0),
                ),
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: isPressed3 ? Colors.blue : Colors.amber,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          isFirst = true;
                          isPressed3 = true;
                          if (isPressed4 == true) isPressed4 = false;
                        },
                      );
                    },
                    child: Text(
                      "Yes",
                    ),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: isPressed4 ? Colors.blue : Colors.amber,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          isFirst = false;
                          isPressed4 = true;
                          if (isPressed3 == true) isPressed3 = false;
                        },
                      );
                    },
                    child: Text(
                      "No",
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 120,
                  padding: EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.amber),
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SinglePlayer(humanPlayer, aiPlayer, isFirst)),
                      );
                    },
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
