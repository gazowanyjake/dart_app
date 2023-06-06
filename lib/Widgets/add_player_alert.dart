// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:wyniki/Providers/newgame_provider.dart';

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
        Consumer<GameProvider>(
          builder: (context, gameProvider, child) {
            return TextButton(
              child: Text('OK',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              onPressed: () {
                  gameProvider.addPlayer(addPlayerName.text);
                  Navigator.of(context).pop();
                },
            );
          },
        )
      ],
    );
  }
}
