// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:wyniki/Providers/game.dart';
import 'package:wyniki/Screens/set_up_game_screen.dart';

class WinnerAlert extends StatelessWidget {
  const WinnerAlert(this.playerName, {super.key});
  final String playerName;

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<Game>(context, listen: false);
    return AlertDialog(
      backgroundColor: Colors.grey,
      title: Text(
        'We have a Winner!!!',
        style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      ),
      content: Text(
        'Congrats $playerName',
        style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      ),
      actions: [
        Consumer<Game>(
          builder: (context, players, child) => TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              gameProvider
                ..winner = false
                ..scoreHistory = []
                ..player0 = []
                ..player1 = []
                ..currentPlayerIndex = 0;
              Navigator.of(context).pushReplacementNamed(SetUpGame.routeName);
            },
            child: const Text(
              'OK',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        )
      ],
    );
  }
}
