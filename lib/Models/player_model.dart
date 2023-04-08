// ignore_for_file: public_member_api_docs

class PlayerModel {
  PlayerModel({
    required this.name,
    required this.score,
    this.isPlaying = false,
  });
  final String name;
  int score;
  bool isPlaying;
}
