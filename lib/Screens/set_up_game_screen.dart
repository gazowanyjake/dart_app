// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:wyniki/Widgets/add_player_alert.dart';
import 'package:wyniki/Widgets/game_settings.dart';
import 'package:wyniki/Widgets/players_list_container.dart';
import 'package:wyniki/Widgets/start_button.dart';

class SetUpGame extends StatelessWidget {
  const SetUpGame({super.key});

  static const routeName = '/setUpGameScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AddPlayerAlert(),
                );
              },
              icon: const Icon(Icons.person_add_alt_1),
            ),
          ],
          backgroundColor: Colors.black,
          title: const Text("Let's play dart!"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            GameSettings(),
            PlayersListContainer(),
            StartButton(),
          ],
        ),
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
    );
  }
}
