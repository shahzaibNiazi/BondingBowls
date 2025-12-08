import 'package:get/get.dart';

import '../controllers/ai_avatar_pick_image_controller.dart';

class AiAvatarPickImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AiAvatarPickImageController>(
      () => AiAvatarPickImageController(),
    );
  }
}
