import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../Widgets/button_score_keybord.dart';

class ScoreKeyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey),
      height: 225,
      width: double.infinity,
      child: StaggeredGrid.count(
          crossAxisCount: 7,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          axisDirection: AxisDirection.down,
          children: [
            for (int i = 1; i < 21; i++)
              ButtonScoreKeyboard(
                content: null,
                textContent: '$i',
                point: i,
              ),
            ButtonScoreKeyboard(
              content: null,
              textContent: '25',
              point: 25,
            ),
            ButtonScoreKeyboard(
              content: null,
              textContent: '0',
              point: 0,
            ),
            ButtonScoreKeyboard(
              content: null,
              textContent: 'DOUBLE',
              width: 2,
              point: 30,
            ),
            ButtonScoreKeyboard(
              content: null,
              textContent: 'TRIPPLE',
              width: 2,
              point: 40,
            ),
            ButtonScoreKeyboard(
              content: Icon(Icons.undo, color: Colors.white,),
              textContent: null,
              width: 2,
              point: 50,
            ),
          ],
        ),
    );
  }
}