class Users {
  int phoneNo;
  String name;
  String gender;
  int age;
  List questions;
  List pain;

  Users(
      {required this.phoneNo,
      required this.name,
      required this.gender,
      required this.age,
      required this.questions,
      required this.pain});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
        phoneNo: json['phoneNo'],
        name: json['fullName'],
        gender: json['gender'],
        age: json['age'],
        questions: json['questions'],
        pain: json['pain']);
  }

  Map<String, dynamic> toJson() => {
        "phoneNo": phoneNo,
        "fullName": name,
        "gender": gender,
        "age": age,
        "questions": questions,
        "pain": pain,
      };
}
