import 'package:get/get.dart';

import '../controllers/received_likes_controller.dart';

class ReceivedLikesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReceivedLikesController>(
      () => ReceivedLikesController(),
    );
  }
}
