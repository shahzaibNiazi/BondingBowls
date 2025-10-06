import 'package:get/get.dart';

import '../provider/network/api_endpoint.dart';
import '../provider/network/api_provider.dart';

class AuthenticationRepository {
  late APIProvider apiClient;

  AuthenticationRepository() {
    apiClient = APIProvider();
  }
  Future login(json) async {
    Map<String, dynamic>? data = await apiClient.basePostAPI(
      ApiEndPoints.login,
      json,
      true,
      loading: true,
      Get.context,
    );
    return data;
  }
}
