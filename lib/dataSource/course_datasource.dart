import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:edproject/constants/endpoint.dart';
import 'package:edproject/model/course_model.dart';
import 'package:edproject/utils/api_request.dart';

class CourseDataSource {
  Future<CourseResponse> getCourse() async {
    // final response =
    //     await request(OptionsRequest(endpointPath: EndpointConstants.couseGet));

    try {
      final response = await Dio().get(
          'https://edspert.widyaedu.com/exercise/data_course?user_email=testerngbayu@gmail.com',
          options: Options(
              headers: {"x-api-key": "18be70c0-4e4d-44ff-a475-50c51ece99a0"}));

      final courseResponse = CourseResponse.fromJson(response.data);

      return courseResponse;
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace, error: e);
      rethrow;
    }
  }
}
