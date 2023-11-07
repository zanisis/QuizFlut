import 'dart:developer';

import 'package:edproject/constants/endpoint.dart';
import 'package:edproject/model/exercise_work_model.dart';
import 'package:edproject/model/score_exercise_model.dart';
import 'package:edproject/utils/api_request.dart';

class ExerciseWorkDataSource {
  Future<ExerciseWorkResponse> getExerciseWork(
      {required String exerciseId}) async {
    final response = await request(OptionsRequest(
      endpointPath: EndpointConstants.exerciseWorkPost,
      body: {
        "exercise_id": exerciseId,
        "user_email": "testerngbayu@gmail.com",
      },
    ));

    final exerciseWorkResponse = ExerciseWorkResponse.fromJson(response.data);

    return exerciseWorkResponse;
  }

  Future<ExerciseWorkResponse> submitExerciseWork(SubmitExercise data) async {
    Map<String, dynamic> newData = data.toMap();
    newData["user_email"] = "testerngbayu@gmail.com";

    final response = await request(OptionsRequest(
      endpointPath: EndpointConstants.submitExerciseWorkPost,
      body: newData,
    ));

    final exerciseWorkResponse = ExerciseWorkResponse.fromJson(response.data);

    return exerciseWorkResponse;
  }

  Future<ScoreExerciseResponse> getScoreExercise(String exerciseId) async {
    final response = await request(OptionsRequest(
      endpointPath: EndpointConstants.scoreExerciseWorkGet,
      queryParam: {
        "exercise_id": exerciseId,
        "user_email": "testerngbayu@gmail.com"
      },
    ));

    final scoreExerciseWorkResponse =
        ScoreExerciseResponse.fromJson(response.data);

    log("${scoreExerciseWorkResponse.toJson()}");
    return scoreExerciseWorkResponse;
  }
}

class SubmitExercise {
  String exerciseId;
  List<String> bankQuestionId;
  List<String> studentAnswer;

  SubmitExercise({
    required this.exerciseId,
    required this.bankQuestionId,
    required this.studentAnswer,
  });

  Map<String, dynamic> toMap() {
    return {
      'exercise_id': exerciseId,
      'bank_question_id': bankQuestionId,
      'student_answer': studentAnswer,
    };
  }
}
