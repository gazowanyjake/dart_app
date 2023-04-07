import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../Providers/game.dart';

class DartHitScoreContainer extends StatelessWidget {
  final int hitScore;

  DartHitScoreContainer(this.hitScore);
  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<Game>(context);
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.black),
      height: 50,
      width: 50,
      child: hitScore == -1 ? null : Text(
        '$hitScore',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
