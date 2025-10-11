import 'package:get/get.dart';

import '../controllers/match_profile_controller.dart';

class MatchProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MatchProfileController>(
      () => MatchProfileController(),
    );
  }
}
