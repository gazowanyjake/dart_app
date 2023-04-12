// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';


class DartHitScoreContainer extends StatelessWidget {

  const DartHitScoreContainer(this.hitScore, {super.key});
  final int hitScore;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: Colors.black),
      height: 48,
      width: 48,
      child: hitScore == -1 ? null : Text(
        '$hitScore',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
