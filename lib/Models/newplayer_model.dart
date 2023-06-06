// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class Player {
  Player({
    required this.playerName,
    required this.initScore,
    required this.playersScoreHistory,
    this.firstHit = -1,
    this.secondHit = -1,
    this.thirdHit = -1,
    this.testColor = Colors.black,
  });
  final String playerName;
  List<int> playersScoreHistory;
  int initScore;
  int firstHit;
  int secondHit;
  int thirdHit;
  Color testColor;
}
