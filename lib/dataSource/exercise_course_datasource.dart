import 'dart:developer';

import 'package:edproject/constants/endpoint.dart';
import 'package:edproject/model/exercise_course_modal.dart';
import 'package:edproject/utils/api_request.dart';

class ExerciseCourseDataSource {
  Future<ExerciseCourseResponse> getExercise({required String courseId}) async {
    final response = await request(OptionsRequest(
        endpointPath: EndpointConstants.exerciseGet,
        queryParam: {
          "course_id": courseId,
          "user_email": "testerngbayu@gmail.com",
        }));

    final exerciseResponse = ExerciseCourseResponse.fromJson(response.data);

    return exerciseResponse;
  }
}
