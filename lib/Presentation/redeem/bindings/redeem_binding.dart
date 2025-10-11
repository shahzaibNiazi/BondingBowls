import 'package:get/get.dart';

import '../controllers/redeem_controller.dart';

class RedeemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RedeemController>(
      () => RedeemController(),
    );
  }
}
