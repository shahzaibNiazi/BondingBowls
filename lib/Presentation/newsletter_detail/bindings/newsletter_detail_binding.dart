import 'package:get/get.dart';

import '../controllers/newsletter_detail_controller.dart';

class NewsletterDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsletterDetailController>(
      () => NewsletterDetailController(),
    );
  }
}
