import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'Screens/set_up_game_screen.dart';
import './Screens/game_screen.dart';
import './Providers/game.dart';

void main() => runApp(MyApp());

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
          accentColor: Colors.white,
        ),
        title: 'Wyniki',
        home: SetUpGame(),
        routes: {
          GameScreen.routeName: (context) => GameScreen(),
          SetUpGame.routeName:(context) => SetUpGame(),
        },
      ),
    );
  }
}
