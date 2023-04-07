import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../Providers/game.dart';

class PlayersListContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<Game>(context);
    final playersList = gameProvider.players;
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.blueGrey,
            height: 400,
            child: ListView.builder(
              itemCount: playersList.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Color.fromARGB(221, 32, 31, 31),
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Theme.of(context).accentColor,
                    ),
                    title: Text(
                      playersList[index],
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.person_off_outlined),
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        gameProvider.deletePlayer(playersList[index]);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
