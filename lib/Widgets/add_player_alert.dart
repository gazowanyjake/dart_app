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
        style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      ),
      content: TextField(
        controller: addPlayerName,
        decoration: InputDecoration(
          hintText: "Player's name",
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
      ),
      actions: [
        Consumer<Game>(
          builder: (context, gameProvider, child) {
            if (gameProvider.players.length < 2) {
              return TextButton(
                child: const Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  gameProvider.addPlayer(addPlayerName.text);
                  Navigator.of(context).pop();
                },
              );
            } else {
              return TextButton(
                child: const Text(
                  'Max player count reached!',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              );
            }
          },
        ),
      ],
    );
  }
}
