import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../views/payment_system_view.dart';

class PaymentSystemController extends GetxController {
  //TODO: Implement PaymentSystemController

  final count = 0.obs;

  bool isReligionUnlocked = false; // Track if religion filter is unlocked

  void onReligionUnlocked() {
    isReligionUnlocked = true;
    update();
    showVoucherDialog(
      context: Get.context!,
      title: "Features Purchase Successful!",
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
      message: "",
    );
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green.shade100,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void increment() => count.value++;
}
