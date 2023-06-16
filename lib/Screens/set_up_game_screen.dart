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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
            color: Theme.of(context).iconTheme.color,
          ),
        ],
        title: Text(
          "Let's play dart!",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (_, p1) => Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const GameSettings(),
                PlayersListContainer(p1.maxHeight - 200),
                const StartButton(),
              ],
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
