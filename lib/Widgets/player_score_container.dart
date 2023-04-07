import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../Providers/game.dart';
import '../Widgets/dart_hit_score_container.dart';

class PlayerScoreContainer extends StatelessWidget {
  final String playersName;
  final int playersScore;
  bool isPlaying;
  final int playerIndex;
  PlayerScoreContainer(
      this.playersName, this.playersScore, this.isPlaying, this.playerIndex);
  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<Game>(context, listen: false);
    // gameProvider.getPlayerScoreContainer(playerIndex);
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      height: 100,
      decoration: BoxDecoration(color: Colors.grey),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 87,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 5,
                ),
                Text(
                  '$playersScore',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                Text(
                  playersName,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  DartHitScoreContainer(gameProvider.returnHitScore1(playerIndex)),
                  SizedBox(
                    width: 5,
                  ),
                  DartHitScoreContainer(gameProvider.returnHitScore2(playerIndex)),
                  SizedBox(
                    width: 5,
                  ),
                  DartHitScoreContainer(gameProvider.returnHitScore3(playerIndex)),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text('score that round'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Text('sets:0'),
                  SizedBox(
                    width: 5,
                  ),
                  Text('legs:0'),
                ],
              ),
              Text('darts thrown'),
            ],
          )
        ],
      ),
    );
  }
}
