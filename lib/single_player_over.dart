import 'package:flutter/material.dart';

import './main.dart';

import './single_player.dart';

class SinglePlayerOver extends StatelessWidget {
  final playerName;
  final humanPlayer;
  final aiPlayer;
  final isFirst;

  SinglePlayerOver(
      this.playerName, this.humanPlayer, this.aiPlayer, this.isFirst);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      title: Text(
        (playerName == "") ? ("Match was a Tie!") : (playerName + " Won!!!"),
        style: TextStyle(color: Colors.white),
      ),
      content: Text(
        "Wanna Play Another Game? Hit Replay.",
        style: TextStyle(color: Colors.white),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    SinglePlayer(humanPlayer, aiPlayer, isFirst),
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
