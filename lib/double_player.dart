import 'package:flutter/material.dart';

import './double_player_over.dart';

class BoardEssentials {
  final id;
  bool isClickable;

  BoardEssentials({this.id, this.isClickable = true});
}

class DoublePlayer extends StatefulWidget {
  DoublePlayer();

  @override
  State<StatefulWidget> createState() {
    return _DoublePlayerState();
  }
}

class _DoublePlayerState extends State<DoublePlayer> {
  String player_1 = "O";
  String player_2 = "X";
  int chance = 0;
  var boardDesc = [" ", " ", " ", " ", " ", " ", " ", " ", " "];

  List<BoardEssentials> boardProp = [];

  @override
  void initState() {
    super.initState();
    boardProp = doInit();
  }

  List<BoardEssentials> doInit() {
    var boardid = <BoardEssentials>[
      BoardEssentials(id: 1),
      BoardEssentials(id: 2),
      BoardEssentials(id: 3),
      BoardEssentials(id: 4),
      BoardEssentials(id: 5),
      BoardEssentials(id: 6),
      BoardEssentials(id: 7),
      BoardEssentials(id: 8),
      BoardEssentials(id: 9),
    ];
    return boardid;
  }

  void gamePlay(BoardEssentials be) {
    ++chance;
    setState(() {
      if (chance % 2 == 1) {
        boardDesc[be.id - 1] = player_1;
        if (checkWin(player_1)) {
          showDialog(
            context: context,
            builder: (_) => DoublePlayerOver("Player-1"),
          );
        }
      } else {
        boardDesc[be.id - 1] = player_2;
        if (checkWin(player_2)) {
          showDialog(
            context: context,
            builder: (_) => DoublePlayerOver("Player-2"),
          );
        }
      }

      if (chance == 9 &&
          checkWin(player_1) == false &&
          checkWin(player_2) == false) {
        showDialog(
          context: context,
          builder: (_) => DoublePlayerOver(""),
        );
      }

      be.isClickable = false;
    });
  }

  bool checkWin(String player) {
    bool playWin = false;

    if (boardDesc[4] == player) {
      if (boardDesc[0] == player && boardDesc[8] == player) playWin = true;
      if (boardDesc[2] == player && boardDesc[6] == player) playWin = true;
      if (boardDesc[1] == player && boardDesc[7] == player) playWin = true;
      if (boardDesc[3] == player && boardDesc[5] == player) playWin = true;
    }
    if (boardDesc[0] == player) {
      if (boardDesc[1] == player && boardDesc[2] == player) playWin = true;
      if (boardDesc[3] == player && boardDesc[6] == player) playWin = true;
    }
    if (boardDesc[8] == player) {
      if (boardDesc[5] == player && boardDesc[2] == player) playWin = true;
      if (boardDesc[7] == player && boardDesc[6] == player) playWin = true;
    }

    return playWin;
  }

  void replayGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);

    setState(() {
      boardProp = doInit();
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.black),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Double Player"),
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
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 1.0,
            ),
            itemCount: 9,
            itemBuilder: (context, index) => Container(
              width: 100.0,
              height: 100.0,
              padding: EdgeInsets.all(3.0),
              child: ElevatedButton(
                onPressed: () {
                  if (boardProp[index].isClickable) gamePlay(boardProp[index]);
                },
                child: Text(
                  boardDesc[index],
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: (boardDesc[index] == " ")
                      ? Colors.yellow
                      : ((boardDesc[index] == "X") ? Colors.red : Colors.blue),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
