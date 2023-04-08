// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:wyniki/Widgets/button_score_keybord.dart';

class ScoreKeyboard extends StatelessWidget {
  const ScoreKeyboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.grey),
      height: 225,
      width: double.infinity,
      child: StaggeredGrid.count(
          crossAxisCount: 7,
          axisDirection: AxisDirection.down,
          children: [
            for (int i = 1; i < 21; i++)
              ButtonScoreKeyboard(
                textContent: '$i',
                point: i,
              ),
            ButtonScoreKeyboard(
              textContent: '25',
              point: 25,
            ),
            ButtonScoreKeyboard(
              textContent: '0',
            ),
            ButtonScoreKeyboard(
              textContent: 'DOUBLE',
              width: 2,
              point: 30,
            ),
            ButtonScoreKeyboard(
              textContent: 'TRIPPLE',
              width: 2,
              point: 40,
            ),
            ButtonScoreKeyboard(
              content: const Icon(Icons.undo, color: Colors.white,),
              width: 2,
              point: 50,
            ),
          ],
        ),
    );
  }
}
