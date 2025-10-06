import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/send_otp_controller.dart';

class SendOtpView extends GetView<SendOtpController> {
  const SendOtpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SendOtpView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SendOtpView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
