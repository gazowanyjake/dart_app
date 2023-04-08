// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:wyniki/Providers/game.dart';
import 'package:wyniki/Screens/game_screen.dart';
import 'package:wyniki/Screens/set_up_game_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(
        //   create: (context) => Players(),
        // ),
        ChangeNotifierProvider(
          create: (context) => Game(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
        ),
        title: 'Wyniki',
        home: const SetUpGame(),
        routes: {
          GameScreen.routeName: (context) => const GameScreen(),
          SetUpGame.routeName: (context) =>const SetUpGame(),
        },
      ),
    );
  }
}
