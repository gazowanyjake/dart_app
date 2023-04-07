import 'package:flutter/material.dart';

import '../Widgets/game_settings.dart';
import '../Widgets/players_list_container.dart';
import '../Widgets/add_player_alert.dart';
import '../Widgets/start_button.dart';

class SetUpGame extends StatelessWidget {
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
                  builder: (context) => AddPlayerAlert()
                );
              },
              icon: Icon(Icons.person_add_alt_1),
            ),
          ],
          backgroundColor: Colors.black,
          title: Text('Bede grał w dart!'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
