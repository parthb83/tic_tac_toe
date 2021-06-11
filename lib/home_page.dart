import 'package:flutter/material.dart';

import './double_player.dart';

class HomePage extends StatelessWidget {
  HomePage();

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
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
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
              onPressed: () => DoublePlayer(),
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
