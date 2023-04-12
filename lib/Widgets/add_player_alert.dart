// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:wyniki/Providers/game.dart';

class AddPlayerAlert extends StatelessWidget {
  AddPlayerAlert({super.key});

  final addPlayerName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey,
      title: Text(
        'Add a new Player!',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      content: TextField(
        controller: addPlayerName,
        decoration: InputDecoration(
          hintText: "Player's name",
          hintStyle: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      actions: [
        Consumer<Game>(
          builder: (context, gameProvider, child) {
            return TextButton(
              child: Text(
                gameProvider.players.length < 2
                    ? 'OK'
                    : 'Max player count reached!',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              onPressed: () {
                if (gameProvider.players.length < 2) {
                  gameProvider.addPlayer(addPlayerName.text);
                  Navigator.of(context).pop();
                } else {
                  Navigator.of(context).pop();
                }
              },
            );
          },
        )
      ],
    );
  }
}
