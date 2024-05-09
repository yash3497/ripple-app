class BalanceTraining {
  final String exerciseId;
  final String demo;
  final String instructions;
  final int rank;
  final String title;

  BalanceTraining(
      {required this.exerciseId,
      required this.demo,
      required this.instructions,
      required this.rank,
      required this.title});

  factory BalanceTraining.fromJson(Map<String, dynamic> json) {
    return BalanceTraining(
        exerciseId: json['exerciseId'],
        demo: json['demo'],
        instructions: json['instructions'],
        rank: json['rank'],
        title: json['title']);
  }

  Map<String, dynamic> toJson() => {
        "exerciseId": exerciseId,
        "demo": demo,
        "instructions": instructions,
        "rank": rank,
        "title": title,
      };
}
