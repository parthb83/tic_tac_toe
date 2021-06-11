import 'package:flutter/material.dart';

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
  final winnerCombos = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  List<BoardEssentials> boardDesc = [];

  @override
  void initState() {
    super.initState();
    boardDesc = doInit();
  }

  List<BoardEssentials> doInit() {
    var boarddesc = <BoardEssentials>[
      BoardEssentials(id: 0),
      BoardEssentials(id: 1),
      BoardEssentials(id: 2),
      BoardEssentials(id: 3),
      BoardEssentials(id: 4),
      BoardEssentials(id: 5),
      BoardEssentials(id: 6),
      BoardEssentials(id: 7),
      BoardEssentials(id: 8),
    ];
    return boarddesc;
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Double Player"),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.0,
            crossAxisSpacing: 9.0,
            mainAxisSpacing: 9.0,
          ),
          itemCount: 9,
          itemBuilder: (context, index) => Container(
            width: 100.0,
            height: 100.0,
            padding: EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: null,
              child: Text(
                (chance % 2 == 0) ? player_2 : player_1,
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow[600],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
