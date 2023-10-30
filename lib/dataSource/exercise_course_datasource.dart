import 'package:edproject/constants/endpoint.dart';
import 'package:edproject/model/exercise_course_model.dart';
import 'package:edproject/utils/api_request.dart';

class ExerciseCourseDataSource {
  Future<ExerciseCourseResponse> getExercise({required String courseId}) async {
    final response = await request(OptionsRequest(
        endpointPath: EndpointConstants.exerciseCourseGet,
        queryParam: {
          "course_id": courseId,
          "user_email": "testerngbayu@gmail.com",
        }));

    final exerciseCourseResponse =
        ExerciseCourseResponse.fromJson(response.data);

    return exerciseCourseResponse;
  }
}
