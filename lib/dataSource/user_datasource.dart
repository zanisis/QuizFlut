import 'package:edproject/constants/endpoint.dart';
import 'package:edproject/model/user_model.dart';
import 'package:edproject/utils/api_request.dart';

class UserDataSource {
  Future<UserResponse> getUser(String email) async {
    final response = await request(
        OptionsRequest(endpointPath: EndpointConstants.userGet, queryParam: {
      "email": email,
    }));

    final userResponse = UserResponse.fromJson(response.data);

    return userResponse;
  }
}
