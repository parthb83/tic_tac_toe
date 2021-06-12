import 'package:flutter/material.dart';

import './main.dart';

import './single_player.dart';

class SinglePlayerOver extends StatelessWidget {
  final playerName;

  SinglePlayerOver(this.playerName);

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
                builder: (context) => SinglePlayer(),
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