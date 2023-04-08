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
          builder: (context, players, child) => TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              players.addPlayer(addPlayerName.text);
            },
            child: const Text('ok'),
          ),
        )
      ],
    );
  }
}
