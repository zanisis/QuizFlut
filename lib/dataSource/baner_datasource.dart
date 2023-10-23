import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:edproject/constants/endpoint.dart';
import 'package:edproject/model/banner_model.dart';
import 'package:edproject/utils/api_request.dart';

class BannerDataSource {
  Future<BannerResponse> getBanner() async {
    // final response =
    //     await request(OptionsRequest(endpointPath: EndpointConstants.couseGet));

    try {
      final response = await Dio().get(
          'https://edspert.widyaedu.com/event/list?limit=5',
          options: Options(
              headers: {"x-api-key": "18be70c0-4e4d-44ff-a475-50c51ece99a0"}));

      final bannerResponse = BannerResponse.fromJson(response.data);

      return bannerResponse;
    } catch (e, stackTrace) {
      log(e.toString(), stackTrace: stackTrace, error: e);
      rethrow;
    }
  }
}
