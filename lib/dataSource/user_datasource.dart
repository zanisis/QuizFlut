import 'package:edproject/constants/endpoint.dart';
import 'package:edproject/model/register_model.dart';
import 'package:edproject/model/user_model.dart';
import 'package:edproject/utils/api_request.dart';

class UserDataSource {
  Future<UserResponse> getUser(String email) async {
    final response = await request(
      OptionsRequest(
        endpointPath: EndpointConstants.userGet,
        queryParam: {
          "email": email,
        },
      ),
    );

    final userResponse = UserResponse.fromJson(response.data);

    return userResponse;
  }

  Future<RegisterResponse> postRegister(Map<String, dynamic> data) async {
    final response = await request(
      OptionsRequest(
        endpointPath: EndpointConstants.registerPost,
        body: data,
      ),
    );

    final registerResponse = RegisterResponse.fromJson(response.data);

    return registerResponse;
  }

  Future<RegisterResponse> updateUser(Map<String, dynamic> data) async {
    final response = await request(
      OptionsRequest(
        endpointPath: EndpointConstants.updateProfilePost,
        body: data,
      ),
    );
    final updateResponse = RegisterResponse.fromJson(response.data);

    return updateResponse;
  }
}
