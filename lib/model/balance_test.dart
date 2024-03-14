class BalanceTest {
  final String title;
  final String description;
  final String instructions;
  final String demo;
  final List<Stages> stages;
  final List<Feedbacks> feedback;
  final int rank;
  final String shortDescription;
  final int timer;

  BalanceTest(
      {required this.title,
      required this.description,
      required this.instructions,
      required this.demo,
      required this.stages,
      required this.feedback,
      required this.rank,
      required this.shortDescription,
      required this.timer});

  factory BalanceTest.fromJson(Map<String, dynamic> json) => BalanceTest(
        title: json['title'],
        description: json['description'],
        instructions: json['instructions'],
        demo: json['demo'] ?? "",
        stages: json['stages'] != null
            ? List<Stages>.from(json['stages'].map((e) => Stages.fromJson(e)))
            : [],
        feedback: List<Feedbacks>.from(
            json['feedback'].map((e) => Feedbacks.fromJson(e))),
        rank: json['rank'] ?? 0,
        shortDescription: json['shortDescription'] ?? "",
        timer: json['timer'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'instructions': instructions,
        'demo': demo,
        'stages': stages.map((e) => e.toJson()),
        'feedback': feedback.map((e) => e.toJson()),
        'rank': rank,
        'shortDescription': shortDescription,
        'timer': timer,
      };
}

class Stages {
  final String stageNumber;
  final String instruction;
  final String timer;
  final String demo;

  Stages(
      {required this.stageNumber,
      required this.instruction,
      required this.timer,
      required this.demo});

  factory Stages.fromJson(Map<String, dynamic> json) {
    return Stages(
        stageNumber: json['stageNumber'] ?? "",
        instruction: json['instruction'] ?? "",
        timer: json['timer'] ?? "",
        demo: json['image'] ?? "");
  }

  Map<String, dynamic> toJson() => {
        'stageNumber': stageNumber,
        'instruction': instruction,
        'timer': timer,
        'image': demo,
      };
}

class Feedbacks {
  final String question;
  final List options;

  Feedbacks({required this.question, required this.options});

  factory Feedbacks.fromJson(Map<String, dynamic> json) {
    return Feedbacks(question: json['question'], options: json['options']);
  }

  Map<String, dynamic> toJson() => {
        'question': question,
        'options': options,
      };
}
