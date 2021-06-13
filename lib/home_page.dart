import 'package:flutter/material.dart';

import './double_player_info.dart';

import './single_player.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              "Choose Your Mode",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            padding: EdgeInsets.fromLTRB(0.0, 130.0, 0.0, 60.0),
          ),
          Container(
            width: 200,
            height: 100,
            child: ElevatedButton(
              child: Text(
                "Single Player",
                style: TextStyle(fontSize: 25.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SinglePlayer(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
              ),
            ),
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
          ),
          Container(
            width: 200,
            height: 100,
            child: ElevatedButton(
              child: Text(
                "Double Player",
                style: TextStyle(fontSize: 25.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DoublePlayerInfo(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
              ),
            ),
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
          ),
        ],
      ),
    );
  }
}
