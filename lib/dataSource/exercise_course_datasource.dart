import 'package:edproject/constants/endpoint.dart';
import 'package:edproject/model/exercise_course_modal.dart';
import 'package:edproject/utils/api_request.dart';

class ExerciseCourseDataSource {
  Future<ExerciseCourseResponse> getExercise() async {
    final response = await request(
        OptionsRequest(endpointPath: EndpointConstants.exerciseGet));

    final exerciseResponse = ExerciseCourseResponse.fromJson(response.data);

    return exerciseResponse;
  }
}
