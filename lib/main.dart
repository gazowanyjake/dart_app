// ignore_for_file: public_member_api_docs
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:wyniki/Providers/newgame_provider.dart';
import 'package:wyniki/screens/game_screen.dart';
import 'package:wyniki/screens/set_up_game_screen.dart';
import 'package:wyniki/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
 
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GameProvider(),
        ),
      ],
      child: MaterialApp(
        theme: blueRedTheme,
        title: 'Wyniki',
        home: const SetUpGame(),
        routes: {
          GameScreen.routeName: (context) => const GameScreen(),
          SetUpGame.routeName: (context) => const SetUpGame(),
        },
      ),
    );
  }
}
