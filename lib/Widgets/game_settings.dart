// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:wyniki/Models/dart_valuse.dart';
import 'package:wyniki/widgets/my_drop_down_button.dart';

class GameSettings extends StatelessWidget {
  const GameSettings({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MyDropDownButton(
          title: 'Points',
          list: pointsList,
        ),
        MyDropDownButton(
          title: 'Check-Out',
          list: checkOutList,
          width: 142,
          color: Theme.of(context).colorScheme.secondary,
        ),
        MyDropDownButton(
          title: 'Sets',
          list: setsList,
        ),
        MyDropDownButton(
          title: 'Legs',
          list: legsList,
        ),
      ],
    );
  }
}
