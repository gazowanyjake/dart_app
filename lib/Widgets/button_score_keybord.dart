// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import 'package:wyniki/Providers/game.dart';

class ButtonScoreKeyboard extends StatelessWidget {
  ButtonScoreKeyboard({
    super.key,
    this.content,
    this.textContent,
    this.width = 1,
    this.point = 0,
  });
  final Widget? content;
  final String? textContent;
  final int width;
  int point;

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
          margin: const EdgeInsets.all(3),
          color: Colors.black,
          child: textContent != null
              ? Text(
                  '$textContent',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                )
              : content,
        ),
      ),
    );
  }
}
