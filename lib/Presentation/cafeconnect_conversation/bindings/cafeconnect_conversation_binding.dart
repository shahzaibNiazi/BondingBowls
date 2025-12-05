import 'package:get/get.dart';

import '../controllers/cafeconnect_conversation_controller.dart';

class CafeconnectConversationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CafeconnectConversationController>(
      () => CafeconnectConversationController(),
    );
  }
}
