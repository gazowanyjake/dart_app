import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../Providers/game.dart';

class ButtonScoreKeyboard extends StatelessWidget {
  final Widget? content;
  final String? textContent;
  final int width;
  int point;

  ButtonScoreKeyboard(
      {this.content, this.textContent, this.width = 1, this.point = 0});

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<Game>(context, listen: false);
    return StaggeredGridTile.count(
      crossAxisCellCount: width,
      mainAxisCellCount: 1,
      child: GestureDetector(
        onTap: () {
         gameProvider.scoreChanger(point);
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(3),
          color: Colors.black,
          child: textContent != null
              ? Text(
                  '$textContent',
                  style: TextStyle(color: Theme.of(context).accentColor),
                )
              : content,
        ),
      ),
    );
  }
}
