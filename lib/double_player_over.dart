import 'package:flutter/material.dart';

import './double_player.dart';

import './main.dart';

class DoublePlayerOver extends StatelessWidget {
  final playerName;

  DoublePlayerOver(this.playerName);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        (playerName == "") ? ("Match was a Tie!") : (playerName + " Won!!!"),
      ),
      content: Text("Wanna Play Another Game? Hit Replay."),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DoublePlayer(),
              ),
            );
          },
          child: Text("Replay"),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyApp(),
              ),
            );
          },
          child: Text("Main Menu"),
        )
      ],
    );
  }
}
