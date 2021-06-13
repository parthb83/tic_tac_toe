import 'package:flutter/material.dart';

import './double_player.dart';

import './main.dart';

class DoublePlayerOver extends StatelessWidget {
  final playerName;
  final player1Name;
  final player2Name;

  DoublePlayerOver(this.playerName, this.player1Name, this.player2Name);

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
                builder: (context) => DoublePlayer(player1Name, player2Name),
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
