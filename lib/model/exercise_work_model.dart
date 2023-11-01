class ExerciseWorkResponse {
  int? status;
  String? message;
  List<ExerciseWorkData>? data;

  ExerciseWorkResponse({
    this.status,
    this.message,
    this.data,
  });

  factory ExerciseWorkResponse.fromJson(Map<String, dynamic> json) =>
      ExerciseWorkResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<ExerciseWorkData>.from(
                json["data"]!.map((x) => ExerciseWorkData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ExerciseWorkData {
  String? exerciseIdFk;
  String? bankQuestionId;
  String? questionTitle;
  String? optionA;
  String? optionB;
  String? optionC;
  String? optionD;
  String? optionE;

  ExerciseWorkData(
      {this.exerciseIdFk,
      this.bankQuestionId,
      this.questionTitle,
      this.optionA,
      this.optionB,
      this.optionC,
      this.optionD,
      this.optionE});

  factory ExerciseWorkData.fromJson(Map<String, dynamic> json) =>
      ExerciseWorkData(
        exerciseIdFk: json["exercise_id_fk"],
        bankQuestionId: json["bank_question_id"],
        questionTitle: json["question_title"],
        optionA: json["option_a"],
        optionB: json["option_b"],
        optionC: json["option_c"],
        optionD: json["option_d"],
        optionE: json["option_e"],
      );

  Map<String, dynamic> toJson() => {
        "exercise_id_fk": exerciseIdFk,
        "bank_question_id": bankQuestionId,
        "question_title": questionTitle,
        "option_a": optionA,
        "option_b": optionB,
        "option_c": optionC,
        "option_d": optionD,
        "option_e": optionE,
      };
}
