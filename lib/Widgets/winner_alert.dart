import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../Providers/game.dart';
import '../Screens/set_up_game_screen.dart';

class WinnerAlert extends StatelessWidget {
  final String playerName;
  WinnerAlert(this.playerName);

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<Game>(context, listen: false);
    return AlertDialog(
      backgroundColor: Colors.grey,
      title: Text(
        'We have a Winner!!!',
        style: TextStyle(color: Theme.of(context).accentColor),
      ),
      content: Container(
        child: Text(
        'Congrats $playerName',
        style: TextStyle(color: Theme.of(context).accentColor),
      ),
      ),
      actions: [
        Consumer<Game>(
          builder: (context, players, child) => TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              gameProvider.winner = false;
              gameProvider.scoreHistory = [];
              gameProvider.player0 = [];
              gameProvider.player1 = [];
              gameProvider.currentPlayerIndex = 0;
              Navigator.of(context).pushReplacementNamed(SetUpGame.routeName);
            },
            child: Text('ok'),
          ),
        )
      ],
    );
  }
}
