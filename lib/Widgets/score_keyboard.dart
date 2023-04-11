// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:wyniki/widgets/button_score_keybord.dart';

class ScoreKeyboard extends StatelessWidget {
  const ScoreKeyboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.grey),
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
            const ButtonScoreKeyboard(
              textContent: '25',
              point: 25,
            ),
            const ButtonScoreKeyboard(
              textContent: '0',
            ),
            const ButtonScoreKeyboard(
              textContent: 'DOUBLE',
              width: 2,
              point: 30,
            ),
            const ButtonScoreKeyboard(
              textContent: 'TRIPPLE',
              width: 2,
              point: 40,
            ),
            const ButtonScoreKeyboard(
              content: Icon(Icons.undo, color: Colors.white,),
              width: 2,
              point: 50,
            ),
          ],
        ),
    );
  }
}
