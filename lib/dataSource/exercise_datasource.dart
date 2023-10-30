import 'package:edproject/constants/endpoint.dart';
import 'package:edproject/model/exercise_work_model.dart';
import 'package:edproject/utils/api_request.dart';

class ExerciseDataSource {
  Future<ExerciseWorkResponse> getExercise({required String exerciseId}) async {
    final response = await request(OptionsRequest(
        endpointPath: EndpointConstants.exerciseWorkGet,
        queryParam: {
          "exercise_id": exerciseId,
          "user_email": "testerngbayu@gmail.com",
        }));

    final exerciseWorkResponse = ExerciseWorkResponse.fromJson(response.data);

    return exerciseWorkResponse;
  }
}
