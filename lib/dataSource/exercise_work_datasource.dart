import 'package:dio/dio.dart';
import 'package:edproject/constants/endpoint.dart';
import 'package:edproject/model/exercise_work_model.dart';
import 'package:edproject/utils/api_request.dart';

class ExerciseWorkDataSource {
  Future<ExerciseWorkResponse> getExerciseWork(
      {required String exerciseId}) async {
    final formData = FormData.fromMap({
      "exercise_id": exerciseId,
      "user_email": "testerngbayu@gmail.com",
    });
    final response = await request(OptionsRequest(
      endpointPath: EndpointConstants.exerciseWorkPost,
      body: formData,
    ));

    final exerciseWorkResponse = ExerciseWorkResponse.fromJson(response.data);

    return exerciseWorkResponse;
  }
}