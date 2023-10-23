import 'dart:developer';

import 'package:dio/dio.dart';

Future<Response> request(OptionsRequest options) async {
  final path = options.endpointPath[0];
  final method = options.endpointPath[1];

  final optionsSetup = BaseOptions(
      baseUrl: 'https://edspert.widyaedu.com',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {"x-api-key": "18be70c0-4e4d-44ff-a475-50c51ece99a0"});
  final dio = Dio(optionsSetup);
  try {
    final response = await dio.request(path,
        data: options.body, options: Options(method: method));
    return response;
  } catch (e, stackTrace) {
    log(e.toString(), stackTrace: stackTrace, error: e);
    rethrow;
  }
}

class OptionsRequest {
  BodyRequest? body;
  List<String> endpointPath;

  OptionsRequest({
    this.body,
    required this.endpointPath,
  });
}

class BodyRequest {
  String? adata;

  BodyRequest({
    this.adata,
  });
}
