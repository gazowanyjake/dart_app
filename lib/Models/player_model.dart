
class PlayerModel {
  final String name;
  int score;
  bool isPlaying;

  PlayerModel({
    required this.name,
    required this.score,
    this.isPlaying = false,
  });
}
