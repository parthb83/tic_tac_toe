import 'package:flutter/material.dart';

import './main.dart';

import './single_player_over.dart';

class BoardEssentials {
  final id;
  bool isClickable;

  BoardEssentials({this.id, this.isClickable = true});
}

class SinglePlayer extends StatefulWidget {
  final humanPlayer;
  final aiPlayer;
  final isFirst;

  SinglePlayer(this.humanPlayer, this.aiPlayer, this.isFirst);

  @override
  State<StatefulWidget> createState() {
    return _SinglePlayerState(humanPlayer, aiPlayer, isFirst);
  }
}

class _SinglePlayerState extends State<SinglePlayer> {
  String humanPlayer;
  String aiPlayer;
  bool isFirst;
  int chance = 0;

  _SinglePlayerState(this.humanPlayer, this.aiPlayer, this.isFirst) {
    if (isFirst == false) chance = 1;
  }

  var boardDesc = [" ", " ", " ", " ", " ", " ", " ", " ", " "];

  List<BoardEssentials> boardProp = [];

  @override
  void initState() {
    super.initState();
    boardProp = doInit();
    if (isFirst == false) firstMove();
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

  void firstMove() {
    int bestScore = -10000000;
    int bestMove = -1;
    for (int i = 0; i < 9; i++) {
      if (boardDesc[i] == " ") {
        boardDesc[i] = aiPlayer;
        int checkScore = minimax(chance, false);
        boardDesc[i] = " ";
        if (checkScore > bestScore) {
          bestScore = checkScore;
          bestMove = i;
        }
      }
    }

    ++chance;
    boardDesc[bestMove] = aiPlayer;
    boardProp[bestMove].isClickable = false;
  }

  void gamePlay(BoardEssentials be) {
    setState(() {
      ++chance;
      boardDesc[be.id - 1] = humanPlayer;
      be.isClickable = false;
      if (checkWin(humanPlayer)) {
        showDialog(
          context: context,
          builder: (_) =>
              SinglePlayerOver("You", humanPlayer, aiPlayer, isFirst),
        );
      }
      if (isFirst == true) {
          if (chance == 9 &&
              checkWin(humanPlayer) == false &&
              checkWin(aiPlayer) == false) {
            showDialog(
              context: context,
              builder: (_) =>
                  SinglePlayerOver("", humanPlayer, aiPlayer, isFirst),
            );
          }
        }

      if (!checkWin(humanPlayer) &&
          ((isFirst == true && chance != 9) ||
              (isFirst == false && chance != 10))) {
        int bestScore = -10000000;
        int bestMove = -1;
        for (int i = 0; i < 9; i++) {
          if (boardDesc[i] == " ") {
            boardDesc[i] = aiPlayer;
            int checkScore = minimax(chance, false);
            boardDesc[i] = " ";
            if (checkScore > bestScore) {
              bestScore = checkScore;
              bestMove = i;
            }
          }
        }

        ++chance;
        boardDesc[bestMove] = aiPlayer;
        boardProp[bestMove].isClickable = false;
        if (checkWin(aiPlayer)) {
          showDialog(
            context: context,
            builder: (_) =>
                SinglePlayerOver("Computer", humanPlayer, aiPlayer, isFirst),
          );
        }
        if (isFirst == true) {
          if (chance == 9 &&
              checkWin(humanPlayer) == false &&
              checkWin(aiPlayer) == false) {
            showDialog(
              context: context,
              builder: (_) =>
                  SinglePlayerOver("", humanPlayer, aiPlayer, isFirst),
            );
          }
        }

        if (isFirst == false) {
          if (chance == 10 &&
              checkWin(humanPlayer) == false &&
              checkWin(aiPlayer) == false) {
            showDialog(
              context: context,
              builder: (_) =>
                  SinglePlayerOver("", humanPlayer, aiPlayer, isFirst),
            );
          }
        }
      }
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

  int minimax(height, isMaxi) {
    if (height % 2 == 1) {
      bool result = checkWin(aiPlayer);
      if (result == true) {
        return 1;
      } else {
        if (isFirst == true) {
          if (height + 1 == 9 && result == false) {
            return 0;
          }
        } else {
          if (height + 1 == 10 && result == false) {
            return 0;
          }
        }
      }
    } else {
      bool result = checkWin(humanPlayer);
      if (result == true) {
        return -1;
      } else {
        if (isFirst == true) {
          if (height + 1 == 9 && result == false) {
            return 0;
          }
        } else {
          if (height + 1 == 10 && result == false) {
            return 0;
          }
        }
      }
    }

    if (isMaxi) {
      int bestScore = -10000000;
      for (int i = 0; i < 9; i++) {
        if (boardDesc[i] == " ") {
          boardDesc[i] = aiPlayer;
          int score = minimax(height + 1, false);
          boardDesc[i] = " ";
          if (bestScore < score) bestScore = score;
        }
      }
      return bestScore;
    } else {
      int bestScore = 10000000;
      for (int i = 0; i < 9; i++) {
        if (boardDesc[i] == " ") {
          boardDesc[i] = humanPlayer;
          int score = minimax(height + 1, true);
          boardDesc[i] = " ";
          if (bestScore > score) bestScore = score;
        }
      }
      return bestScore;
    }
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
            builder: (context) => SinglePlayer(humanPlayer, aiPlayer, isFirst),
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
          title: Text("Single Player"),
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
