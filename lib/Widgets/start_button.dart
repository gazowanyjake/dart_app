// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:wyniki/Providers/game.dart';
import 'package:wyniki/Screens/game_screen.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<Game>(context, listen: false);
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(2),
        height: 50,
        width: 250,
        decoration: const BoxDecoration(color: Colors.red),
        child: Text(
          'Start',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      onTap: () async {
        gameProvider..playerIndexCreator()
        ..setPlayersInitialScores()
        ..liveBoxMapGenerate();
        await Navigator.of(context).pushNamed(GameScreen.routeName);
      },
    );
  }
}
