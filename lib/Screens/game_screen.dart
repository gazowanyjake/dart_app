import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:wyniki/Screens/set_up_game_screen.dart';

import '../Widgets/player_score_container.dart';
import '../Widgets/score_keyboard.dart';
import '../Providers/game.dart';
import '../Widgets/winner_alert.dart';

class GameScreen extends StatelessWidget {
  static const routeName = '/game-screen';

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<Game>(context);
    gameProvider.createPlayersModels();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back)),
        title: Text('Have Fun!'),
        backgroundColor: Colors.black,
      ),
      body: gameProvider
                  .winner
          ? WinnerAlert(gameProvider.winnerName)
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: gameProvider.players.length,
                    itemBuilder: (context, index) {
                      return PlayerScoreContainer(
                          gameProvider.playersAndScoresModels[index].name,
                          gameProvider.playersAndScoresModels[index].score,
                          gameProvider.playersAndScoresModels[index].isPlaying,
                          index);
                    },
                  ),
                ),
                ScoreKeyboard(),
              ],
            ),
    );
  }
}
