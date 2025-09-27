import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/email_verification_controller.dart';

class EmailVerificationView extends GetView<EmailVerificationController> {
  const EmailVerificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EmailVerificationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EmailVerificationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
