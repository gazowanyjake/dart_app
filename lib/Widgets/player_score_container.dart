// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:wyniki/Models/newplayer_model.dart';
import 'package:wyniki/Providers/newgame_provider.dart';
import 'package:wyniki/widgets/dart_hit_score_container.dart';

class PlayerScoreContainer extends StatelessWidget {
  PlayerScoreContainer({
    required this.player,
    required this.playerIndex,
    super.key,
  });

  Player player;
  int playerIndex;
  
  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);
    final playerIndicator = gameProvider.currentPlayerIndicator(playerIndex);
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8, top: 8),
      height: 96,
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border(
          left: BorderSide(color: playerIndicator, width: 16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 88,
            child: Column(
              children: [
                const SizedBox(
                  height: 4,
                ),
                Text(
                  '${player.initScore}',
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  player.playerName,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  DartHitScoreContainer(
                    player.firstHit, player.testColor,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  DartHitScoreContainer(
                    player.secondHit, player.testColor,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  DartHitScoreContainer(
                    player.thirdHit, player.testColor,
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
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
                    width: 4,
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
