// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:wyniki/Providers/newgame_provider.dart';
import 'package:wyniki/Screens/set_up_game_screen.dart';

class WinnerAlert extends StatelessWidget {
  const WinnerAlert(this.playerName, {super.key});
  final String playerName;

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context, listen: false);
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
        Consumer<GameProvider>(
          builder: (context, players, child) => TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              gameProvider
                ..winner = false
                ..scoreHistory = [];
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
