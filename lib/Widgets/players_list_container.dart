// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:wyniki/Providers/game.dart';

class PlayersListContainer extends StatelessWidget {
  const PlayersListContainer({super.key});


  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<Game>(context);
    final playersList = gameProvider.players;
    return Expanded(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.blueGrey,
            height: 400,
            child: ListView.builder(
              itemCount: playersList.length,
              itemBuilder: (context, index) {
                return Card(
                  color:const Color.fromARGB(221, 32, 31, 31),
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    title: Text(
                      playersList[index],
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.person_off_outlined),
                      color: Theme.of(context).colorScheme.secondary,
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
