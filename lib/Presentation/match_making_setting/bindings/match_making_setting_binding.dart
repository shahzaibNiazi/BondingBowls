import 'package:get/get.dart';

import '../controllers/match_making_setting_controller.dart';

class MatchMakingSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MatchMakingSettingController>(
      () => MatchMakingSettingController(),
    );
  }
}
