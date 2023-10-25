import 'package:edproject/constants/endpoint.dart';
import 'package:edproject/model/banner_model.dart';
import 'package:edproject/utils/api_request.dart';

class BannerDataSource {
  Future<BannerResponse> getBanner() async {
    final response = await request(
        OptionsRequest(endpointPath: EndpointConstants.bannerGet, queryParam: {
      "limit": 5,
    }));

    final bannerResponse = BannerResponse.fromJson(response.data);

    return bannerResponse;
  }
}
