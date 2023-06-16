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
        margin: const EdgeInsets.only(bottom: 24),
        height: 48,
        width: 248,
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.primary),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
          ),
        ),
        child: Text(
          'Start',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      onTap: () {
        if (gameProvider.players.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Add players',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 2),
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
          );
          return;
        }
        gameProvider.scoreSetterStartButton();
        Navigator.of(context).pushNamed(GameScreen.routeName);
      },
    );
  }
}
