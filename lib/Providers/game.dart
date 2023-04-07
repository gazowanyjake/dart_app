import 'package:flutter/material.dart';

import 'package:collection/collection.dart';

import '../Models/live_box.dart';
import '../Models/player_model.dart';

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

    print(scoreHistory);
    notifyListeners();
  }

  int liveScore = 0;
  int liveScoreBox1 = -1;
  int liveScoreBox2 = -1;
  int liveScoreBox3 = -1;

  int playerScoreContainerIndex = 0;

  void getPlayerScoreContainer(int containerIndex) {
    playerScoreContainerIndex = containerIndex;
  }

  // void liveScoreBox() {
  //   if (liveScoreBox1 == -1) {
  //     liveScoreBox1 = liveScore;
  //   } else if (liveScoreBox2 == -1) {
  //     liveScoreBox2 = liveScore;
  //   } else if (liveScoreBox3 == -1) {
  //     liveScoreBox3 = liveScore;
  //   } else {
  //     liveScoreBox1 = liveScore;
  //     liveScoreBox2 = -1;
  //     liveScoreBox3 = -1;
  //   }
  //   scoreHistory.add(liveScore);
  //   addPlayersScores();
  //   // sumOfTheeHits();
  //   // nextPlayer();
  //   notifyListeners();
  // }

  // void undoHitScore() {
  //   if (scoreHistory.isEmpty) {
  //     return;
  //   } else {
  //     int lastHit = scoreHistory.last;
  //     undoPlayersScores();
  //     // previousPlayer();
  //     scoreHistory.remove(lastHit);
  //     // updatePlayersScores();
  //     if (lastHit == liveScoreBox3) {
  //       liveScoreBox3 = -1;
  //     } else if (lastHit == liveScoreBox2) {
  //       liveScoreBox2 = -1;
  //     } else if (lastHit == liveScoreBox1 && scoreHistory.isNotEmpty) {
  //       liveScoreBox1 = scoreHistory[scoreHistory.length - 3];
  //       liveScoreBox2 = scoreHistory[scoreHistory.length - 2];
  //       liveScoreBox3 = scoreHistory.last;
  //     } else {
  //       liveScoreBox1 = -1;
  //     }
  //   }
  //   print(scoreHistory);
  //   notifyListeners();
  // }

  // List<int> scoreOfThreeOut = [];

  // void sumOfTheeHits() {
  //   int chunkSize = 3;
  //   List<int> scoreOfThree = [];
  //   for (var i = 0; i < scoreHistory.length; i += chunkSize) {
  //     scoreOfThree.add(scoreHistory
  //         .sublist(
  //             i,
  //             i + chunkSize > scoreHistory.length
  //                 ? scoreHistory.length
  //                 : i + chunkSize)
  //         .sum);
  //   }
  //   scoreOfThreeOut = scoreOfThree;
  //   // print(scoreOfThreeOut);
  // }

  List<int> liveBoxList = [];

  Map<int, int> liveBoxMap = {};

  List<LiveBox> liveBoxModels = [];

  void liveBoxMapGenerate() {
    for (int i = 0; i < 3 * players.length; i++) {
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
        liveBoxMap.update(0, (value) => player0.last);
        liveBoxMap.update(1, (value) => -1);
        liveBoxMap.update(2, (value) => -1);
      }
    } else if (playerIndexList[currentPlayerIndex] == 1) {
      if (liveBoxMap[3] == -1) {
        liveBoxMap.update(3, (value) => player1.last);
      } else if (liveBoxMap[4] == -1) {
        liveBoxMap.update(4, (value) => player1.last);
      } else if (liveBoxMap[5] == -1) {
        liveBoxMap.update(5, (value) => player1.last);
      } else {
        liveBoxMap.update(3, (value) => player1.last);
        liveBoxMap.update(4, (value) => -1);
        liveBoxMap.update(5, (value) => -1);
      }
    }
    liveBoxModelsGenerate();
    print(liveBoxMap);
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
      int lastHit = scoreHistory.last;
      undoPlayersScores();
      undoPlayerScoreHistory();
      scoreHistory.remove(lastHit);
      if (playerIndexList[currentPlayerIndex] == 0) {
        if (lastHit == liveBoxMap[2]) {
          liveBoxMap.update(2, (value) => -1);
        } else if (lastHit == liveBoxMap[1]) {
          liveBoxMap.update(1, (value) => -1);
        } else if (lastHit == liveBoxMap[0] && player0.isNotEmpty) {
          liveBoxMap.update(0, (value) => player0[player0.length - 3]);
          liveBoxMap.update(1, (value) => player0[player0.length - 2]);
          liveBoxMap.update(2, (value) => player0.last);
        } else {
          liveBoxMap.update(0, (value) => -1);
        }
      } else if (playerIndexList[currentPlayerIndex] == 1) {
        if (lastHit == liveBoxMap[5]) {
          liveBoxMap.update(5, (value) => -1);
        } else if (lastHit == liveBoxMap[4]) {
          liveBoxMap.update(4, (value) => -1);
        } else if (lastHit == liveBoxMap[3] && player1.isNotEmpty) {
          liveBoxMap.update(3, (value) => player1[player1.length - 3]);
          liveBoxMap.update(4, (value) => player1[player1.length - 2]);
          liveBoxMap.update(5, (value) => player1.last);
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

  List<String> _players = [
    'Kuba',
    'Julka',
  ];

  List player0 = [];
  List player1 = [];

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
    int playersNumber = players.length;
    List<int> temp = [];
    if (playersNumber == 1) {
      for (int i = 0; i < 50; i++) {
        temp += [0, 0, 0];
      }
    } else if (playersNumber == 2) {
      for (int i = 0; i < 50; i++) {
        temp += [0, 0, 0, 1, 1, 1];
      }
    } else if (playersNumber == 3) {
      for (int i = 0; i < 50; i++) {
        temp += [0, 0, 0, 1, 1, 1, 2, 2, 2];
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
        (value) => value = value - scoreHistory.last);

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
    print(currentPlayerIndex);
    createPlayersModels();
    // print(liveBoxMap[0]);
  }

  bool winner = false;
  String winnerName = '';

  void endScoreValidationPlayer0() {
    if (player0.last == liveBoxMap[2]) {
      print('doszlem');
      liveBoxMap.update(2, (value) => -1);
      liveBoxMap.update(1, (value) => -1);
      liveBoxMap.update(0, (value) => -1);
      liveBoxModelsGenerate();
      for (int i = 0; i < 3; i++) {
        playersAndScores.update(
            players[0], (value) => value = value + player0.last as int);
        player0.removeLast();
        scoreHistory.removeLast();
      }
      for (int j = 0; j < 3; j++) {
        player0.add(0);
        scoreHistory.add(0);
      }
    } else if (player0.last == liveBoxMap[1]) {
      print('doszlem1');
      liveBoxMap.update(1, (value) => -1);
      liveBoxMap.update(0, (value) => -1);
      liveBoxModelsGenerate();
      for (int i = 0; i < 2; i++) {
        playersAndScores.update(
            players[0], (value) => value = value + player0.last as int);
        player0.removeLast();
        scoreHistory.removeLast();
      }
      for (int j = 0; j < 3; j++) {
        player0.add(0);
        scoreHistory.add(0);
      }
      currentPlayerIndexSetterAdd();
    } else if (player0.last == liveBoxMap[0]) {
      print('doszlem2');
      liveBoxMap.update(0, (value) => -1);
      liveBoxModelsGenerate();
      playersAndScores.update(
          players[0], (value) => value = value + player0.last as int);
      player0.removeLast();
      scoreHistory.removeLast();
      for (int j = 0; j < 3; j++) {
        player0.add(0);
        scoreHistory.add(0);
      }
    for (int i = 0; i < 2; i++) {
      currentPlayerIndexSetterAdd();
    }
    }
    if (playersAndScoresModels[0].score < 0 && player0.length > 2) {
      liveBoxMap.update(2, (value) => player0.last);
      liveBoxMap.update(1, (value) => player0[player0.length - 2]);
      liveBoxMap.update(0, (value) => player0[player0.length - 3]);
    }
  }

  void endScoreValidationPlayer1() {
    if (player1.last == liveBoxMap[5]) {
      print('doszlem10');
      liveBoxMap.update(5, (value) => -1);
      liveBoxMap.update(4, (value) => -1);
      liveBoxMap.update(3, (value) => -1);
      liveBoxModelsGenerate();
      for (int i = 0; i < 3; i++) {
        playersAndScores.update(
            players[1], (value) => value = value + player1.last as int);
        player1.removeLast();
        scoreHistory.removeLast();
      }
      for (int j = 0; j < 3; j++) {
        player1.add(0);
        scoreHistory.add(0);
      }
    } else if (player1.last == liveBoxMap[4]) {
      print('doszlem11');
      liveBoxMap.update(4, (value) => -1);
      liveBoxMap.update(3, (value) => -1);
      liveBoxModelsGenerate();
      for (int i = 0; i < 2; i++) {
        playersAndScores.update(
            players[1], (value) => value = value + player1.last as int);
        player1.removeLast();
        scoreHistory.removeLast();
      }
      for (int j = 0; j < 3;j++) {
        player1.add(0);
        scoreHistory.add(0);
      }
      currentPlayerIndexSetterAdd();
    } else if (player1.last == liveBoxMap[3]) {
      print('doszlem12');
      liveBoxMap.update(3, (value) => -1);
      liveBoxModelsGenerate();
      playersAndScores.update(
          players[1], (value) => value = value + player1.last as int);
      player1.removeLast();
      scoreHistory.removeLast();
      for (int j = 0; j < 3;j++) {
        player1.add(0);
        scoreHistory.add(0);
      }
    for (int i = 0; i < 2; i++) {
      currentPlayerIndexSetterAdd();
    }
    }
    if (playersAndScoresModels[0].score < 0 && player1.length > 2) {
      liveBoxMap.update(2, (value) => player1.last);
      liveBoxMap.update(1, (value) => player1[player1.length - 2]);
      liveBoxMap.update(0, (value) => player1[player1.length - 3]);
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
        (value) => value = value + scoreHistory.last);
    // print(playersAndScores);
    // print(currentPlayerIndex);
  }

  int initScore = 101;

  void setPlayersInitialScores() {
    if (playersInitialScores.isEmpty) {
      for (int i = 0; i < _players.length; i++) {
        playersInitialScores.add(initScore);
      }
    } else {
      playersInitialScores = [];
      for (int i = 0; i < _players.length; i++) {
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



  // void player1Score(){
  //   for (var e = 0; e < scoreOfThree.length; e++) {
  //   int playersNumber = playersList.length;
  //   int player1;
  //   player1 = scoreOfThree[e = e + playersNumber];
  //   print(player1);
  // }
          // scoreOfThree.fold(0, (previousValue, element) {
          //   for(var i = 0; i < scoreOfThree.length; i ++){
          //     int playersNumber = playersList.length;
          //     return
          //   }}

  // int? addPlayersScores(bool isPlaying, int playerIndex) {
  //   int score = 0;
  //   if(isPlaying) {
  //         score = playersAndScoresModels[playerIndex].score - scoreHistory.last;
  //         playersAndScoresModels[playerIndex].isPlaying = false;
  //   }else {
  //     score = playersAndScoresModels[playerIndex].score;
  //     playersAndScoresModels[playerIndex].isPlaying = true;
  //   }
  //   notifyListeners();
  //   return score;
  //   // print(playersAndScores);
  // }
  // List<LiveBox> liveBoxList = [];

  // void createLiveBoxList() {
  //   liveBoxList = liveboxMap.entries
  //       .map((livebox) => LiveBox(index: livebox.key, hitscore: livebox.value))
  //       .toList();
  // }

  // Map<int, int> liveboxMap = {};

  // void createLiveBoxMap() {
  //   liveboxMap = Map.fromIterables(indexListForLiveScore, scoreHistory);
  //   print(liveboxMap);
  // }
  // void nextPlayer() {}

  // void previousPlayer() {
  //   int playerNumber = players.length;
  //   for (int i = 0; i < scoreOfThreeOut.length; i += playerNumber) {
  //     playersAndScores.update(
  //         players[i], (value) => value = value + scoreHistory.last);
  //   }
  // }

  // void addPlayersScores() {
  //   playersAndScores.update(
  //       players[0], (value) => value = value - scoreHistory.last);
  //   print(playersAndScores);
  // }
   // List <int> sublistPlayerIndexList = [];
  // void createSubListPlayerIndexList(){
  //   sublistPlayerIndexList = playerIndexList.sublist(0, currentPlayerIndex);
  //   print(sublistPlayerIndexList);
  //   createLiveBoxMap();
  // }