import 'package:flutter/material.dart';

import './double_player_over.dart';

import './main.dart';

class BoardEssentials {
  final id;
  bool isClickable;

  BoardEssentials({this.id, this.isClickable = true});
}

class DoublePlayer extends StatefulWidget {
  final player1Name;
  final player2Name;

  DoublePlayer(this.player1Name, this.player2Name);

  @override
  State<StatefulWidget> createState() {
    return _DoublePlayerState(player1Name, player2Name);
  }
}

class _DoublePlayerState extends State<DoublePlayer> {
  String player1Name;
  String player2Name;
  String currPlayer = "";
  _DoublePlayerState(this.player1Name, this.player2Name) {
    if (player1Name == "") player1Name = "Player-1";
    if (player2Name == "") player2Name = "Player-2";

    currPlayer = player1Name;
  }

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
        currPlayer = player2Name;
        boardDesc[be.id - 1] = player_1;
        if (checkWin(player_1)) {
          showDialog(
            context: context,
            builder: (_) =>
                DoublePlayerOver(player1Name, player1Name, player2Name),
          );
        }
      } else {
        currPlayer = player1Name;
        boardDesc[be.id - 1] = player_2;
        if (checkWin(player_2)) {
          showDialog(
            context: context,
            builder: (_) =>
                DoublePlayerOver(player2Name, player1Name, player2Name),
          );
        }
      }

      if (chance == 9 &&
          checkWin(player_1) == false &&
          checkWin(player_2) == false) {
        showDialog(
          context: context,
          builder: (_) => DoublePlayerOver("", player1Name, player2Name),
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

  void selectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoublePlayer(player1Name, player2Name),
          ),
        );
        break;

      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyApp(),
          ),
        );
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.black),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(currPlayer + " Turn"),
          actions: [
            Theme(
              data: Theme.of(context).copyWith(
                  textTheme: TextTheme().apply(bodyColor: Colors.black),
                  dividerColor: Colors.white,
                  iconTheme: IconThemeData(color: Colors.white)),
              child: PopupMenuButton<int>(
                color: Colors.black,
                itemBuilder: (context) => [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text("Reset"),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text("Main Menu"),
                  ),
                ],
                onSelected: (item) => selectedItem(context, item),
              ),
            ),
          ],
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
          child: GridView.builder(
            padding: EdgeInsets.fromLTRB(0.0, 130.0, 0.0, 100.0),
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
