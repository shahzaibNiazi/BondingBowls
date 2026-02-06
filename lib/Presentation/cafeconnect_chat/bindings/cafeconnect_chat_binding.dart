import 'package:get/get.dart';

import '../controllers/cafeconnect_chat_controller.dart';

class CafeconnectChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CafeconnectChatController>(
      () => CafeconnectChatController(),
    );
  }
}
