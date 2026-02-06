import 'package:get/get.dart';

import '../controllers/system_chat_controller.dart';

class SystemChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SystemChatController>(
      () => SystemChatController(),
    );
  }
}
