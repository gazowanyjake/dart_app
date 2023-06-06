// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:wyniki/Models/newplayer_model.dart';

class GameProvider with ChangeNotifier {
  List<Player> players = [
    Player(playerName: 'p1', initScore: 101, playersScoreHistory: []),
    Player(playerName: 'p2', initScore: 101, playersScoreHistory: []),
    Player(playerName: 'p3', initScore: 101, playersScoreHistory: []),
  ];

  void addPlayer(String playerNameInput) {
    players.add(
      Player(
        playerName: playerNameInput,
        initScore: 101,
        playersScoreHistory: [],
      ),
    );
    notifyListeners();
  }

  void deletePlayer(Player player) {
    players.remove(player);
    notifyListeners();
  }

  int initScore = 101;

  void scoreSetterBeforeGame(int initScoreChosen) {
    initScore = initScoreChosen;
  }

  void scoreSetterStartButton() {
    for (var i = 0; i < players.length; i++) {
      players[i].initScore = initScore;
      players[i].playersScoreHistory = [];
      players[i].firstHit = -1;
      players[i].secondHit = -1;
      players[i].thirdHit = -1;
      players[i].testColor = Colors.black;
      playerIndexProvider = 0;
      isDouble = false;
      isTripple = false;
    }
  }

  Color currentPlayerIndicator(int playerIndex) {
    if (playerIndexProvider == playerIndex &&
        players[playerIndex].thirdHit == -1 &&
        players[playerIndex].testColor == Colors.black) {
      return Colors.green;
    } else if ((playerIndexProvider + 1 < players.length
                ? playerIndexProvider + 1
                : 0) ==
            playerIndex &&
        players[playerIndex - 1 >= 0 ? playerIndex - 1 : players.length - 1]
                .thirdHit !=
            -1) {
      return Colors.green;
    } else if (players[
                    playerIndex - 1 >= 0 ? playerIndex - 1 : players.length - 1]
                .testColor ==
            Colors.red &&
        (playerIndexProvider + 1 < players.length
                ? playerIndexProvider + 1
                : 0) ==
            playerIndex) {
      return Colors.green;
    } else {
      return Colors.grey;
    }
  }

  List<int> scoreHistory = [];

  int playerIndexProvider = 0;

  double scoreHistoryNaTrzy = 0;

  double testNaTrzy = 0;

  void testCalculator() {
    scoreHistoryNaTrzy = scoreHistory.length / 3;

    testNaTrzy = scoreHistoryNaTrzy - scoreHistoryNaTrzy.floorToDouble();
  }

  bool isDouble = false;
  bool isTripple = false;

  void addScoreComponent(int playerNumber, int playerNumberNext) {
    if (playerIndexProvider == playerNumber) {
      if (players[playerNumber].firstHit == -1) {
        players[playerNumber].firstHit = scoreHistory.last;
      } else if (scoreHistory.length > 3 * players.length &&
          players[playerNumber].firstHit ==
              players[playerNumber].playersScoreHistory[
                  players[playerNumber].playersScoreHistory.length - 3] &&
          players[playerNumber].secondHit ==
              players[playerNumber].playersScoreHistory[
                  players[playerNumber].playersScoreHistory.length - 2] &&
          players[playerNumber].thirdHit ==
              players[playerNumber].playersScoreHistory.last) {
        players[playerNumber].firstHit = -1;
        players[playerNumber].secondHit = -1;
        players[playerNumber].thirdHit = -1;
        players[playerNumber].firstHit = scoreHistory.last;
      } else if (players[playerNumber].secondHit == -1) {
        players[playerNumber].secondHit = scoreHistory.last;
      } else if (players[playerNumber].thirdHit == -1 && players.length == 1) {
        players[playerNumber].thirdHit = scoreHistory.last;
      } else if (players[playerNumber].thirdHit == -1 && players.length != 1) {
        players[playerNumber].thirdHit = scoreHistory.last;
        players[playerNumberNext].firstHit = -1;
        players[playerNumberNext].secondHit = -1;
        players[playerNumberNext].thirdHit = -1;
        players[playerNumberNext].testColor = Colors.black;
      } else if (players[players.length - 1].thirdHit ==
          scoreHistory[scoreHistory.length - 2]) {
        players[playerNumber].firstHit = -1;
        players[playerNumber].secondHit = -1;
        players[playerNumber].thirdHit = -1;
        players[playerNumber].firstHit = scoreHistory.last;
      }
    }
  }

  bool winner = false;
  String winnerName = '';

  Color boxColor = Colors.black;

  void endScoreValidation(Player currentPlayer) {
    if (currentPlayer.initScore < 0) {
      if (currentPlayer.thirdHit != -1) {
        for (var i = 0; i < 3; i++) {
          currentPlayer.initScore += scoreHistory.last;
          scoreHistory.removeLast();
          currentPlayer.playersScoreHistory.removeLast();
        }
      } else if (currentPlayer.secondHit != -1 &&
          currentPlayer.thirdHit == -1) {
        for (var i = 0; i < 2; i++) {
          currentPlayer.initScore += scoreHistory.last;
          scoreHistory.removeLast();
          currentPlayer.playersScoreHistory.removeLast();
        }
      } else if (currentPlayer.firstHit != -1 &&
          currentPlayer.secondHit == -1) {
        currentPlayer.initScore += scoreHistory.last;
        scoreHistory.removeLast();
        currentPlayer.playersScoreHistory.removeLast();
      }
      players[playerIndexProvider + 1 < players.length
              ? playerIndexProvider + 1
              : 0]
          .firstHit = -1;
      players[playerIndexProvider + 1 < players.length
              ? playerIndexProvider + 1
              : 0]
          .secondHit = -1;
      players[playerIndexProvider + 1 < players.length
              ? playerIndexProvider + 1
              : 0]
          .thirdHit = -1;
      players[playerIndexProvider + 1 < players.length
              ? playerIndexProvider + 1
              : 0]
          .testColor = Colors.black;
      currentPlayer.testColor = Colors.red;
    } else if (currentPlayer.initScore == 0) {
      winner = true;
      winnerName = players[playerIndexProvider].playerName;
    }
  }

  void addScore(int hitPointFinal) {
    testCalculator();
    scoreHistory.add(hitPointFinal);
    if (scoreHistoryNaTrzy == scoreHistoryNaTrzy.ceil() &&
        scoreHistoryNaTrzy != 0 &&
        players[playerIndexProvider].firstHit != -1) {
      playerIndexProvider += 1;
      if (playerIndexProvider == players.length) {
        playerIndexProvider = 0;
      }
    }
    players[playerIndexProvider].initScore -= hitPointFinal;
    players[playerIndexProvider].playersScoreHistory.add(hitPointFinal);
    print(
        'index : $playerIndexProvider historia: ${players[playerIndexProvider].playersScoreHistory}');
    addScoreComponent(
      playerIndexProvider,
      playerIndexProvider + 1 < players.length ? playerIndexProvider + 1 : 0,
    );
    endScoreValidation(players[playerIndexProvider]);
    notifyListeners();
    print('score: $scoreHistory testnatrzy: $testNaTrzy');
  }

  void undoScoreComponent(int playerNumber, int lastHitTemp) {
    if (lastHitTemp == players[playerNumber].thirdHit &&
        players[playerNumber + 1 < players.length ? playerNumber + 1 : 0]
                .firstHit ==
            -1 &&
        scoreHistory.length > 3 * players.length - 2) {
      players[playerNumber].thirdHit = -1;
      players[playerNumber + 1 < players.length ? playerNumber + 1 : 0]
              .firstHit =
          players[playerNumber + 1 < players.length ? playerNumber + 1 : 0]
                  .playersScoreHistory[
              players[playerNumber + 1 < players.length ? playerNumber + 1 : 0]
                      .playersScoreHistory
                      .length -
                  3];
      players[playerNumber + 1 < players.length ? playerNumber + 1 : 0]
              .secondHit =
          players[playerNumber + 1 < players.length ? playerNumber + 1 : 0]
                  .playersScoreHistory[
              players[playerNumber + 1 < players.length ? playerNumber + 1 : 0]
                      .playersScoreHistory
                      .length -
                  2];
      players[playerNumber + 1 < players.length ? playerNumber + 1 : 0]
              .thirdHit =
          players[playerNumber + 1 < players.length ? playerNumber + 1 : 0]
              .playersScoreHistory
              .last;
    } else if (lastHitTemp == players[playerNumber].thirdHit) {
      players[playerNumber].thirdHit = -1;
    } else if (lastHitTemp == players[playerNumber].secondHit &&
        players[playerNumber + 1 < players.length ? playerNumber + 1 : 0]
                .firstHit ==
            -1 &&
        scoreHistory.length > 3 * players.length - 2 &&
        players[playerNumber].testColor == Colors.red) {
      players[playerNumber].secondHit = -1;
      players[playerNumber + 1 < players.length ? playerNumber + 1 : 0]
              .firstHit =
          players[playerNumber + 1 < players.length ? playerNumber + 1 : 0]
                  .playersScoreHistory[
              players[playerNumber + 1 < players.length ? playerNumber + 1 : 0]
                      .playersScoreHistory
                      .length -
                  3];
      players[playerNumber + 1 < players.length ? playerNumber + 1 : 0]
              .secondHit =
          players[playerNumber + 1 < players.length ? playerNumber + 1 : 0]
                  .playersScoreHistory[
              players[playerNumber + 1 < players.length ? playerNumber + 1 : 0]
                      .playersScoreHistory
                      .length -
                  2];
      players[playerNumber + 1 < players.length ? playerNumber + 1 : 0]
              .thirdHit =
          players[playerNumber + 1 < players.length ? playerNumber + 1 : 0]
              .playersScoreHistory
              .last;
    } else if (lastHitTemp == players[playerNumber].secondHit) {
      players[playerNumber].secondHit = -1;
    } else if (lastHitTemp == players[playerNumber].firstHit &&
        players[playerNumber + 1 < players.length ? playerNumber + 1 : 0]
                .firstHit ==
            -1 &&
        scoreHistory.length > 3 * players.length - 2 &&
        players[playerNumber].testColor == Colors.red) {
      players[playerNumber].firstHit = -1;
      players[playerNumber].firstHit =
          players[playerNumber].playersScoreHistory[
              players[playerNumber].playersScoreHistory.length - 3];
      players[playerNumber].secondHit =
          players[playerNumber].playersScoreHistory[
              players[playerNumber].playersScoreHistory.length - 2];
      players[playerNumber].thirdHit =
          players[playerNumber].playersScoreHistory.last;
    } else if (lastHitTemp == players[playerNumber].firstHit &&
        scoreHistory.isNotEmpty &&
        playerNumber != 0 &&
        players[playerNumber].playersScoreHistory.length > 2) {
      players[playerNumber].firstHit = -1;
      players[playerNumber].firstHit =
          players[playerNumber].playersScoreHistory[
              players[playerNumber].playersScoreHistory.length - 3];
      players[playerNumber].secondHit =
          players[playerNumber].playersScoreHistory[
              players[playerNumber].playersScoreHistory.length - 2];
      players[playerNumber].thirdHit =
          players[playerNumber].playersScoreHistory.last;
      // players[playerNumber - 1].firstHit =
      //     players[playerNumber - 1].playersScoreHistory[
      //         players[playerNumber - 1].playersScoreHistory.length - 3];
      // players[playerNumber - 1].secondHit =
      //     players[playerNumber - 1].playersScoreHistory[
      //         players[playerNumber - 1].playersScoreHistory.length - 2];
      // players[playerNumber - 1].thirdHit =
      //     players[playerNumber - 1].playersScoreHistory.last;
    } else {
      players[playerNumber].firstHit = -1;
    }
    players[playerNumber].testColor = Colors.black;
  }

  void renderOldScoreHistory() {
    if (players.last.testColor == Colors.red) {
      return;
    } else if(scoreHistory.length < 3 * players.length){
      return;
    }
    for (var i = 0; i < players.length; i++) {
      players[players.length - (i + 1)].thirdHit =
          players[players.length - (i + 1)].playersScoreHistory.last;
      players[players.length - (i + 1)].secondHit =
          players[players.length - (i + 1)].playersScoreHistory[
              players[players.length - (i + 1)].playersScoreHistory.length - 2];
      players[players.length - (i + 1)].firstHit =
          players[players.length - (i + 1)].playersScoreHistory[
              players[players.length - (i + 1)].playersScoreHistory.length - 3];
    }
  }

  void undoScore() {
    if (scoreHistory.isEmpty) {
      return;
    } else {
      testCalculator();
      int lastHit = players[playerIndexProvider].playersScoreHistory.last;
      if (players[playerIndexProvider].firstHit == -1 &&
          players[playerIndexProvider].playersScoreHistory.length > 2) {
        players[playerIndexProvider].firstHit =
            players[playerIndexProvider].playersScoreHistory[
                players[playerIndexProvider].playersScoreHistory.length - 3];
        players[playerIndexProvider].secondHit =
            players[playerIndexProvider].playersScoreHistory[
                players[playerIndexProvider].playersScoreHistory.length - 2];
        players[playerIndexProvider].thirdHit =
            players[playerIndexProvider].playersScoreHistory.last;
        if (playerIndexProvider == 0) {
          playerIndexProvider = players.length - 1;
        } else {
          playerIndexProvider -= 1;
        }
        notifyListeners();
        return;
      } else if (players[playerIndexProvider].testColor == Colors.black) {
        players[playerIndexProvider].initScore += lastHit;
        players[playerIndexProvider].playersScoreHistory.removeLast();
        scoreHistory.removeLast();
      } else if (players[playerIndexProvider].testColor == Colors.red &&
          players[playerIndexProvider].thirdHit != -1) {
        players[playerIndexProvider].initScore -=
            players[playerIndexProvider].firstHit +
                players[playerIndexProvider].secondHit;
        players[playerIndexProvider].playersScoreHistory
          ..add(players[playerIndexProvider].firstHit)
          ..add(players[playerIndexProvider].secondHit);
        scoreHistory
          ..add(players[playerIndexProvider].firstHit)
          ..add(players[playerIndexProvider].secondHit);
        lastHit = players[playerIndexProvider].thirdHit;
      } else if (players[playerIndexProvider].testColor == Colors.red &&
          players[playerIndexProvider].secondHit != -1 &&
          players[playerIndexProvider].thirdHit == -1) {
        players[playerIndexProvider].initScore -=
            players[playerIndexProvider].firstHit;
        players[playerIndexProvider]
            .playersScoreHistory
            .add(players[playerIndexProvider].firstHit);
        scoreHistory.add(players[playerIndexProvider].firstHit);
        lastHit = players[playerIndexProvider].secondHit;
      } else if (players[playerIndexProvider].testColor == Colors.red &&
          players[playerIndexProvider].firstHit != -1 &&
          players[playerIndexProvider].secondHit == -1 &&
          players[playerIndexProvider].thirdHit == -1) {
        players[playerIndexProvider + 1 < players.length
                ? playerIndexProvider + 1
                : 0]
            .firstHit = players[playerIndexProvider + 1 < players.length
                ? playerIndexProvider + 1
                : 0]
            .playersScoreHistory[players[
                    playerIndexProvider + 1 < players.length
                        ? playerIndexProvider + 1
                        : 0]
                .playersScoreHistory
                .length -
            3];
        players[playerIndexProvider + 1 < players.length
                ? playerIndexProvider + 1
                : 0]
            .secondHit = players[playerIndexProvider + 1 < players.length
                ? playerIndexProvider + 1
                : 0]
            .playersScoreHistory[players[
                    playerIndexProvider + 1 < players.length
                        ? playerIndexProvider + 1
                        : 0]
                .playersScoreHistory
                .length -
            2];
        players[playerIndexProvider + 1 < players.length
                ? playerIndexProvider + 1
                : 0]
            .thirdHit = players[playerIndexProvider + 1 < players.length
                ? playerIndexProvider + 1
                : 0]
            .playersScoreHistory
            .last;
            players[playerIndexProvider].testColor == Colors.black;
        print('object');
      }
      if (scoreHistoryNaTrzy == scoreHistoryNaTrzy.ceil() ||
          testNaTrzy > 0.65 && testNaTrzy < 0.67) {
            print('dziendobry $lastHit');
        undoScoreComponent(playerIndexProvider, lastHit);
        print(playerIndexProvider);
      } else if (testNaTrzy > 0.32 && testNaTrzy < 0.34) {
        undoScoreComponent(playerIndexProvider, lastHit);
        if (scoreHistory.isNotEmpty && playerIndexProvider != 0) {
          playerIndexProvider -= 1;
        } else if (playerIndexProvider == 0 && scoreHistory.isNotEmpty) {
          playerIndexProvider = players.length - 1;
          renderOldScoreHistory();
        }
      }
      notifyListeners();
      print(testNaTrzy);
      print(
          'index : $playerIndexProvider historia: ${players[playerIndexProvider].playersScoreHistory} undo na trzy$testNaTrzy');
    }
  }

  void scoreChanger(int buttonScoreInfo) {
    if (buttonScoreInfo < 26 && isDouble == false && isTripple == false) {
      addScore(buttonScoreInfo);
    } else if (buttonScoreInfo < 26 && isDouble == true && isTripple == false) {
      addScore(buttonScoreInfo * 2);
      isDouble = false;
    } else if (buttonScoreInfo < 26 && isTripple == true && isDouble == false) {
      addScore(buttonScoreInfo * 3);
      isTripple = false;
    } else if (buttonScoreInfo == 30 && isTripple == false) {
      isDouble = true;
    } else if (buttonScoreInfo == 40 && isDouble == false) {
      isTripple = true;
    } else if (buttonScoreInfo == 50) {
      isDouble = false;
      isTripple = false;
      undoScore();
    }
  }
}
