// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:wyniki/Providers/newgame_provider.dart';

class PlayersListContainer extends StatelessWidget {
  PlayersListContainer(this.listHeight);
  double listHeight;
  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GameProvider>(context);
    final playersList = gameProvider.players;
    return SizedBox(
      height: listHeight,
      child: ListView.builder(
        itemCount: playersList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
              ),
              child: Card(
                shadowColor: Colors.transparent,
                color: Colors.transparent,
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  title: Text(
                    playersList[index].playerName,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.person_off_outlined),
                    color: Theme.of(context).iconTheme.color,
                    onPressed: () {
                      gameProvider.deletePlayer(playersList[index]);
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
