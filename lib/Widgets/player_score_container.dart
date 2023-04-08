// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:wyniki/Providers/game.dart';
import 'package:wyniki/widgets/dart_hit_score_container.dart';

class PlayerScoreContainer extends StatelessWidget {
  const PlayerScoreContainer(
      this.playersName, this.playersScore, this.playerIndex,
      {super.key,});
  final String playersName;
  final int playersScore;
  final int playerIndex;
  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<Game>(context, listen: false);
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      height: 100,
      decoration: const BoxDecoration(color: Colors.grey),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 87,
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '$playersScore',
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  playersName,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  DartHitScoreContainer(
                      gameProvider.returnHitScore1(playerIndex),),
                  const SizedBox(
                    width: 5,
                  ),
                  DartHitScoreContainer(
                      gameProvider.returnHitScore2(playerIndex),),
                  const SizedBox(
                    width: 5,
                  ),
                  DartHitScoreContainer(
                      gameProvider.returnHitScore3(playerIndex),),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('score that round'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: const [
                  Text('sets:0'),
                  SizedBox(
                    width: 5,
                  ),
                  Text('legs:0'),
                ],
              ),
              const Text('darts thrown'),
            ],
          )
        ],
      ),
    );
  }
}
