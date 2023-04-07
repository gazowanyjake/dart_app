import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../Providers/game.dart';

class AddPlayerAlert extends StatelessWidget {
  final addPlayerName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey,
      title: Text(
        'Add a new Player!',
        style: TextStyle(color: Theme.of(context).accentColor),
      ),
      content: Container(
        child: TextField(
          controller: addPlayerName,
          decoration: InputDecoration(
            hintText: 'Player\'s name',
            hintStyle: TextStyle(color: Theme.of(context).accentColor),
          ),
        ),
      ),
      actions: [
        Consumer<Game>(
          builder: (context, players, child) => TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              players.addPlayer(addPlayerName.text);
            },
            child: Text('ok'),
          ),
        )
      ],
    );
  }
}
