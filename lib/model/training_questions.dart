class TrainingQuestions {
  final List options;
  final String correctOption;
  final String questionText;
  final String questionId;
  final String type;

  TrainingQuestions(
      {required this.options,
      required this.correctOption,
      required this.questionText,
      required this.questionId,
      required this.type});

  factory TrainingQuestions.fromJson(Map<String, dynamic> json) {
    return TrainingQuestions(
        options: json['options'],
        correctOption: json['correctOption'],
        questionText: json['questionText'] ?? "Odd One Out",
        questionId: json['questionId'],
        type: json['type']);
  }

  Map<String, dynamic> toJson() => {
        "options": options,
        "correctOption": correctOption,
        "questionText": questionText,
        "questionId": questionId,
        "type": type,
      };
}
