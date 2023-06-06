// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:wyniki/Providers/newgame_provider.dart';
import 'package:wyniki/widgets/player_score_container.dart';
import 'package:wyniki/widgets/score_keyboard.dart';
import 'package:wyniki/widgets/winner_alert.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  static const routeName = '/game-screen';

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Have Fun!'),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: 
        gameProvider.winner
            ? WinnerAlert(gameProvider.winnerName)
            : 
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: gameProvider.players.length,
                      itemBuilder: (context, index) {
                        return PlayerScoreContainer(
                          player: gameProvider.players[index],
                          playerIndex: index,
                        );
                      },
                    ),
                  ),
                  const ScoreKeyboard(),
                ],
              ),
      ),
    );
  }
}
