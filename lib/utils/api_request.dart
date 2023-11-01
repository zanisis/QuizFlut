import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<Response> request(OptionsRequest optionsReq) async {
  final method = optionsReq.endpointPath[0];
  final path = optionsReq.endpointPath[1];

  final optionsSetup = BaseOptions(
      baseUrl: 'https://edspert.widyaedu.com',
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      headers: {"x-api-key": dotenv.env["API_KEY"]});

  final dio = Dio(optionsSetup);

  try {
    final response = await dio.request(
      path,
      data: optionsReq.body,
      queryParameters: optionsReq.queryParam,
      options: Options(method: method),
    );
    return response;
  } catch (e, stackTrace) {
    log(e.toString(), stackTrace: stackTrace, error: e);
    rethrow;
  }
}

class OptionsRequest {
  FormData? body;
  List<String> endpointPath;
  Map<String, dynamic>? queryParam;

  OptionsRequest({this.body, required this.endpointPath, this.queryParam});
}
