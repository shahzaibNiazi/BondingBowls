import 'dart:convert';

import 'package:convo_hearts/data/model/user_model.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../../../app/config/global_var.dart';
import '../../../app/routes/app_pages.dart';
import '../../../data/provider/local_storage/local_db.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.elasticOut),
    );

    animationController.forward();

    Future.delayed(const Duration(seconds: 4), () async {
      String? response = await LocalDB.getData('user_data');
      String? token = await LocalDB.getData('auth_token');
      if (response != null) {
        Globals.user = UserModel.fromJson(
          jsonDecode(await LocalDB.getData('user_data')),
        );
        Globals.authToken = token ?? '';
        if (token != null && token.isNotEmpty) {
          Get.offAllNamed(Routes.PROFILE_CREATION_DECISION);
        } else {
          Get.offAllNamed(Routes.THIRD_SPLASH);
        }
      } else {
        Get.offAllNamed(Routes.THIRD_SPLASH);
      }
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
