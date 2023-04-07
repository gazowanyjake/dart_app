import 'package:flutter/material.dart';

import 'my_drop_down_button.dart';
import '../Models/dart_valuse.dart';

class GameSettings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MyDropDownButton(
          title: 'Punkty',
          text: punktyLista,
        ),
        MyDropDownButton(
          title: 'Check-Out',
          text: checkOutLista,
          width: 125,
          color: Colors.red,
        ),
        MyDropDownButton(
          title: 'Sets',
          text: setsLista,
        ),
        MyDropDownButton(
          title: 'Legs',
          text: legsLista,
        ),
      ],
    );
  }
}
