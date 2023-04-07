import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../Screens/game_screen.dart';
import '../Providers/game.dart';

class StartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<Game>(context, listen: false);
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(2),
        height: 50,
        width: 250,
        decoration: BoxDecoration(color: Colors.red),
        child: Text(
          'Start',
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      onTap: () async {
        gameProvider.playerIndexCreator();
        gameProvider.setPlayersInitialScores();
        gameProvider.liveBoxMapGenerate();
        await Navigator.of(context).pushNamed(GameScreen.routeName);
      },
    );
  }
}
