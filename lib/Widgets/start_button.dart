// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:wyniki/Providers/newgame_provider.dart';
import 'package:wyniki/Screens/game_screen.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context, listen: false);
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(4),
        height: 48,
        width: 248,
        decoration: const BoxDecoration(color: Colors.red),
        child: Text(
          'Start',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      onTap: () {
        gameProvider.scoreSetterStartButton();
        Navigator.of(context).pushNamed(GameScreen.routeName);
      },
    );
  }
}
