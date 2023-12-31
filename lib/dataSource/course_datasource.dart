import 'package:edproject/constants/endpoint.dart';
import 'package:edproject/model/course_model.dart';
import 'package:edproject/utils/api_request.dart';

class CourseDataSource {
  Future<CourseResponse> getCourse() async {
    final response = await request(OptionsRequest(
        endpointPath: EndpointConstants.couseGet,
        queryParam: {
          "major_name": "IPA",
          "user_email": "testerngbayu@gmail.com"
        }));
    final courseResponse = CourseResponse.fromJson(response.data);

    return courseResponse;
  }
}
