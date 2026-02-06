import 'package:get/get.dart';

import '../controllers/newsletter_controller.dart';

class NewsletterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsletterController>(
      () => NewsletterController(),
    );
  }
}
