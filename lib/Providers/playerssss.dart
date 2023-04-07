import 'package:flutter/material.dart';

class Players with ChangeNotifier {
  List<String> _players = [
    'Kuba',
    'Julka',
  ];

  List<int> playersInitialScores = [];

  Map<String, int> playersAndScores = {};

  // void updatePlayersScores (){
  //   for (var e = 0; e < .length; e++) {
  //   int playersNumber = playersList.length;
  //   int player1;
  //   player1 = scoreOfThree[e = e + playersNumber];
  //   print(player1);
  // }
  //   playersInitialScores[players[]]
  // }

  int initScore = 101;

  void getInitialScores(int targetChosen){
    initScore = targetChosen;
  }

  void setPlayersInitialScores() {
    if(playersInitialScores.isEmpty){
    for (int i = 0; i < _players.length; i++) {
      playersInitialScores.add(initScore);
    }
    }else{
      playersInitialScores = [];
      for (int i = 0; i < _players.length; i++) {
      playersInitialScores.add(initScore);
    }
    }
    playersAndScores = Map.fromIterables(players, playersInitialScores);
    print(playersAndScores);
  }

  List<String> get players {
    return [..._players];
  }

  void addPlayer(String player) {
    _players.add(player);
    notifyListeners();
  }

  void deletePlayer(String player) {
    _players.remove(player);
    notifyListeners();
  }
  
}
