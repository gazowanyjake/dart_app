// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:wyniki/Models/dart_valuse.dart';
import 'package:wyniki/Widgets/my_drop_down_button.dart';

class GameSettings extends StatelessWidget {
  const GameSettings({super.key});


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MyDropDownButton(
          title: 'Punkty',
          text: punktyList,
        ),
        MyDropDownButton(
          title: 'Check-Out',
          text: checkOutList,
          width: 125,
          color: Colors.red,
        ),
        MyDropDownButton(
          title: 'Sets',
          text: setsList,
        ),
        MyDropDownButton(
          title: 'Legs',
          text: legsList,
        ),
      ],
    );
  }
}
