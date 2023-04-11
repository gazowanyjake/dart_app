// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:wyniki/widgets/add_player_alert.dart';
import 'package:wyniki/widgets/game_settings.dart';
import 'package:wyniki/widgets/players_list_container.dart';
import 'package:wyniki/widgets/start_button.dart';


class SetUpGame extends StatelessWidget {
  const SetUpGame({super.key});

  static const routeName = '/setUpGameScreen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                showDialog<Widget>(
                  context: context,
                  builder: (context) {
                    return AddPlayerAlert();
                  },
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
      ),
    );
  }
}
