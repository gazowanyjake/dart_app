// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:wyniki/Models/live_box.dart';
import 'package:wyniki/Models/player_model.dart';

class Game with ChangeNotifier {
  bool isDouble = false;
  bool isTripple = false;

  void scoreSetter(int score) {
    initScore = score;
  }

  List<int> scoreHistory = [];

  void scoreChanger(int hitPoint) {
    if (hitPoint < 26 && isDouble == false && isTripple == false) {
      liveScore = hitPoint;
      playersAndScoresModels[playerIndexList[currentPlayerIndex]].score -=
          hitPoint;
      // liveScoreBox();
      addPlayersScores();
    } else if (hitPoint < 26 && isDouble == true && isTripple == false) {
      liveScore = hitPoint * 2;
      // liveScoreBox();
      playersAndScoresModels[playerIndexList[currentPlayerIndex]].score -=
          hitPoint * 2;
      isDouble = false;
      addPlayersScores();
    } else if (hitPoint < 26 && isTripple == true && isDouble == false) {
      liveScore = hitPoint * 3;
      // liveScoreBox();
      playersAndScoresModels[playerIndexList[currentPlayerIndex]].score -=
          hitPoint * 3;
      isTripple = false;
      addPlayersScores();
    } else if (hitPoint == 30 && isTripple == false) {
      isDouble = true;
    } else if (hitPoint == 40 && isDouble == false) {
      isTripple = true;
    } else if (hitPoint == 50) {
      isDouble = false;
      isTripple = false;
      // undoHitScore();
      undoLiveBox();
    }

    // print(scoreHistory);
    notifyListeners();
  }

  int liveScore = 0;

  int playerScoreContainerIndex = 0;

  void getPlayerScoreContainer(int containerIndex) {
    playerScoreContainerIndex = containerIndex;
  }

  List<int> liveBoxList = [];

  Map<int, int> liveBoxMap = {};

  List<LiveBox> liveBoxModels = [];

  void liveBoxMapGenerate() {
    for (var i = 0; i < 3 * players.length; i++) {
      liveBoxList.add(i);
    }
    liveBoxMap = {for (var element in liveBoxList) element: -1};
    liveBoxModelsGenerate();
    // print(liveBoxMap);
  }

  void liveBoxModelsGenerate() {
    liveBoxModels = liveBoxMap.entries
        .map((element) => LiveBox(index: element.key, hitscore: element.value))
        .toList();
  }

  void updateLiveBox() {
    if (playerIndexList[currentPlayerIndex] == 0) {
      if (liveBoxMap[0] == -1) {
        liveBoxMap.update(0, (value) => player0.last);
      } else if (liveBoxMap[1] == -1) {
        liveBoxMap.update(1, (value) => player0.last);
      } else if (liveBoxMap[2] == -1) {
        liveBoxMap.update(2, (value) => player0.last);
      } else {
        liveBoxMap..update(0, (value) => player0.last)
        ..update(1, (value) => -1)
        ..update(2, (value) => -1);
      }
    } else if (playerIndexList[currentPlayerIndex] == 1) {
      if (liveBoxMap[3] == -1) {
        liveBoxMap.update(3, (value) => player1.last);
      } else if (liveBoxMap[4] == -1) {
        liveBoxMap.update(4, (value) => player1.last);
      } else if (liveBoxMap[5] == -1) {
        liveBoxMap.update(5, (value) => player1.last);
      } else {
        liveBoxMap..update(3, (value) => player1.last)
        ..update(4, (value) => -1)
        ..update(5, (value) => -1);
      }
    }
    liveBoxModelsGenerate();
    // print(liveBoxMap);
  }

  int returnHitScore1(int currentPlayerTemp) {
    if (currentPlayerTemp == 0) {
      return liveBoxModels[0].hitscore;
    } else if (currentPlayerTemp == 1) {
      return liveBoxModels[3].hitscore;
    }
    return 66;
  }

  int returnHitScore2(int currentPlayerTemp) {
    if (currentPlayerTemp == 0) {
      return liveBoxModels[1].hitscore;
    } else if (currentPlayerTemp == 1) {
      return liveBoxModels[4].hitscore;
    }
    return 66;
  }
  /// ostatnie scoreboxy 1 i 2 gracza
  int returnHitScore3(int currentPlayerTemp) {
    if (currentPlayerTemp == 0) {
      return liveBoxModels[2].hitscore;
    } else if (currentPlayerTemp == 1) {
      return liveBoxModels[5].hitscore;
    }
    return 66;
  }

  void undoLiveBox() {
    if (scoreHistory.isEmpty) {
      return;
    } else {
      final lastHit = scoreHistory.last;
      undoPlayersScores();
      undoPlayerScoreHistory();
      scoreHistory.remove(lastHit);
      if (playerIndexList[currentPlayerIndex] == 0) {
        if (lastHit == liveBoxMap[2]) {
          liveBoxMap.update(2, (value) => -1);
        } else if (lastHit == liveBoxMap[1]) {
          liveBoxMap.update(1, (value) => -1);
        } else if (lastHit == liveBoxMap[0] && player0.isNotEmpty) {
          liveBoxMap..update(0, (value) => player0[player0.length - 3])
          ..update(1, (value) => player0[player0.length - 2])
          ..update(2, (value) => player0.last);
        } else {
          liveBoxMap.update(0, (value) => -1);
        }
      } else if (playerIndexList[currentPlayerIndex] == 1) {
        if (lastHit == liveBoxMap[5]) {
          liveBoxMap.update(5, (value) => -1);
        } else if (lastHit == liveBoxMap[4]) {
          liveBoxMap.update(4, (value) => -1);
        } else if (lastHit == liveBoxMap[3] && player1.isNotEmpty) {
          liveBoxMap..update(3, (value) => player1[player1.length - 3])
          ..update(4, (value) => player1[player1.length - 2])
          ..update(5, (value) => player1.last);
        } else {
          liveBoxMap.update(3, (value) => -1);
        }
      }
    }
    liveBoxModelsGenerate();
    // print(liveBoxMap);
    // print(scoreHistory);
  }

  // player related stuff
  //
  //
  //
  //
  //
  //

  final List<String> _players = [
    'Kuba',
    'Julka',
  ];

  List<int> player0 = [];
  List<int> player1 = [];
 
  Color currentPlayerIndicator (int player){
    if(playerIndexList[currentPlayerIndex] == player){
      return Colors.green;
    } else {
      return Colors.grey;
    }
  }

  void playerScoreHistoryGenerator() {
    if (playerIndexList[currentPlayerIndex] == 0) {
      player0.add(scoreHistory[currentPlayerIndex]);
    } else if (playerIndexList[currentPlayerIndex] == 1) {
      player1.add(scoreHistory[currentPlayerIndex]);
    }
    // print(player1);
    // print(player);
  }

  void undoPlayerScoreHistory() {
    if (playerIndexList[currentPlayerIndex] == 0) {
      player0.remove(scoreHistory[currentPlayerIndex]);
    } else if (playerIndexList[currentPlayerIndex] == 1) {
      player1.remove(scoreHistory[currentPlayerIndex]);
    }
    // print(player1);
    // print(player);
  }

  void playerIndexCreator() {
    final playersNumber = players.length;
    var temp = <int>[];
    if (playersNumber == 1) {
      for (var i = 0; i < 50; i++) {
        temp += [0, 0, 0];
      }
    } else if (playersNumber == 2) {
      for (var i = 0; i < 50; i++) {
        temp += [0, 0, 0, 1, 1, 1];
      }
    }
    playerIndexList = temp;
    // print(playerIndexList);
  }

  List<int> playerIndexList = [];

  List<int> playersInitialScores = [];

  Map<String, int> playersAndScores = {};

  List<PlayerModel> playersAndScoresModels = [];

  void createPlayersModels() {
    playersAndScoresModels = playersAndScores.entries
        .map((player) => PlayerModel(name: player.key, score: player.value))
        .toList();
  }

  void addPlayersScores() {
    scoreHistory.add(liveScore);
    playerScoreHistoryGenerator();
    playersAndScores.update(players[playerIndexList[currentPlayerIndex]],
        (value) => value = value - scoreHistory.last,);

    // print(playersAndScores);
    updateLiveBox();
    if (playersAndScoresModels[playerIndexList[currentPlayerIndex]].score < 0) {
      if (playersAndScoresModels[0].score < 0) {
        endScoreValidationPlayer0();
      } else if (playersAndScoresModels[1].score < 0) {
        endScoreValidationPlayer1();
      }
    } else if (playersAndScoresModels[playerIndexList[currentPlayerIndex]]
            .score ==
        0) {
      if (playersAndScoresModels[0].score == 0) {
        winner = true;
        winnerName = playersAndScoresModels[0].name;
      } else if (playersAndScoresModels[1].score == 0) {
        winner = true;
        winnerName = playersAndScoresModels[1].name;
      }
    }
    currentPlayerIndexSetterAdd();
    // print(playerIndexList[currentPlayerIndex]);
    // print(currentPlayerIndex);
    createPlayersModels();
    // print(liveBoxMap[0]);
  }

  bool winner = false;
  String winnerName = '';

  void endScoreValidationPlayer0() {
    if (player0.last == liveBoxMap[2]) {
      liveBoxMap..update(2, (value) => -1)
      ..update(1, (value) => -1)
      ..update(0, (value) => -1);
      liveBoxModelsGenerate();
      for (var i = 0; i < 3; i++) {
        playersAndScores.update(
            players[0], (value) => value = value + player0.last,);
        player0.removeLast();
        scoreHistory.removeLast();
      }
      for (var j = 0; j < 3; j++) {
        player0.add(0);
        scoreHistory.add(0);
      }
    } else if (player0.last == liveBoxMap[1]) {
      liveBoxMap..update(1, (value) => -1)
      ..update(0, (value) => -1);
      liveBoxModelsGenerate();
      for (var i = 0; i < 2; i++) {
        playersAndScores.update(
            players[0], (value) => value = value + player0.last,);
        player0.removeLast();
        scoreHistory.removeLast();
      }
      for (var j = 0; j < 3; j++) {
        player0.add(0);
        scoreHistory.add(0);
      }
      currentPlayerIndexSetterAdd();
    } else if (player0.last == liveBoxMap[0]) {
      liveBoxMap.update(0, (value) => -1);
      liveBoxModelsGenerate();
      playersAndScores.update(
          players[0], (value) => value = value + player0.last,);
      player0.removeLast();
      scoreHistory.removeLast();
      for (var j = 0; j < 3; j++) {
        player0.add(0);
        scoreHistory.add(0);
      }
      for (var i = 0; i < 2; i++) {
        currentPlayerIndexSetterAdd();
      }
    }
    if (playersAndScoresModels[0].score < 0 && player0.length > 2) {
      liveBoxMap..update(2, (value) => player0.last)
      ..update(1, (value) => player0[player0.length - 2])
      ..update(0, (value) => player0[player0.length - 3]);
    }
  }

  void endScoreValidationPlayer1() {
    if (player1.last == liveBoxMap[5]) {
      liveBoxMap..update(5, (value) => -1)
      ..update(4, (value) => -1)
      ..update(3, (value) => -1);
      liveBoxModelsGenerate();
      for (var i = 0; i < 3; i++) {
        playersAndScores.update(
            players[1], (value) => value = value + player1.last,);
        player1.removeLast();
        scoreHistory.removeLast();
      }
      for (var j = 0; j < 3; j++) {
        player1.add(0);
        scoreHistory.add(0);
      }
    } else if (player1.last == liveBoxMap[4]) {
      liveBoxMap..update(4, (value) => -1)
      ..update(3, (value) => -1);
      liveBoxModelsGenerate();
      for (var i = 0; i < 2; i++) {
        playersAndScores.update(
            players[1], (value) => value = value + player1.last,);
        player1.removeLast();
        scoreHistory.removeLast();
      }
      for (var j = 0; j < 3; j++) {
        player1.add(0);
        scoreHistory.add(0);
      }
      currentPlayerIndexSetterAdd();
    } else if (player1.last == liveBoxMap[3]) {
      liveBoxMap.update(3, (value) => -1);
      liveBoxModelsGenerate();
      playersAndScores.update(
          players[1], (value) => value = value + player1.last,);
      player1.removeLast();
      scoreHistory.removeLast();
      for (var j = 0; j < 3; j++) {
        player1.add(0);
        scoreHistory.add(0);
      }
      for (var i = 0; i < 2; i++) {
        currentPlayerIndexSetterAdd();
      }
    }
    if (playersAndScoresModels[0].score < 0 && player1.length > 2) {
      liveBoxMap..update(2, (value) => player1.last)
      ..update(1, (value) => player1[player1.length - 2])
      ..update(0, (value) => player1[player1.length - 3]);
    }
  }

  int currentPlayerIndex = 0;

  void currentPlayerIndexSetterAdd() {
    liveIndexAdd();
    currentPlayerIndex += 1;
  }

  void currentPlayerIndexSetterUndo() {
    currentPlayerIndex -= 1;
    liveIndexUndo();
  }

  List<int> indexListForLiveScore = [];
  void liveIndexAdd() {
    indexListForLiveScore.add(currentPlayerIndex);
  }

  void liveIndexUndo() {
    indexListForLiveScore.remove(currentPlayerIndex);
  }

  void undoPlayersScores() {
    currentPlayerIndexSetterUndo();
    playersAndScores.update(players[playerIndexList[currentPlayerIndex]],
        (value) => value = value + scoreHistory.last,);
    // print(playersAndScores);
    // print(currentPlayerIndex);
  }

  int initScore = 101;

  void setPlayersInitialScores() {
    if (playersInitialScores.isEmpty) {
      for (var i = 0; i < _players.length; i++) {
        playersInitialScores.add(initScore);
      }
    } else {
      playersInitialScores = [];
      for (var i = 0; i < _players.length; i++) {
        playersInitialScores.add(initScore);
      }
    }
    playersAndScores = Map.fromIterables(players, playersInitialScores);
    // print(playersAndScores);
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
