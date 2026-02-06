import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controllers/profile_creation_controller.dart';

class VoicePromptOneView extends GetView<ProfileCreationController> {
  const VoicePromptOneView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileCreationController>(
      init: ProfileCreationController(),
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.redoRecording();
                            Get.back();
                          },
                          child: SvgPicture.asset(
                            "assets/icon/svg/back_arrow.svg",
                          ),
                        ),
                        const SizedBox(width: 16),
                      ],
                    ),
                    Center(
                      child: Text(
                        "Voice Prompts",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    /// Info text
                    Text(
                      '*Voice prompts is an optional feature where you answer questions here with your voice. Your voice will be added to your profile for everyone else to hear',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Color(0xff505050),
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 24),

                    Obx(
                      () => TextField(
                        onChanged: controller.updateQuestion,
                        maxLength: 40,
                        decoration: InputDecoration(
                          hintText: 'Type your questions here',
                          counterText: '', // Hides default counter
                          contentPadding: const EdgeInsets.fromLTRB(
                            16,
                            16,
                            16,
                            16,
                          ),
                          suffix: Text(
                            '${controller.question.value.length}/40',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Color(0xff505050),
                            ),
                          ),
                          // Always 2px border
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Color(0xff505050),
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Color(0xff505050),
                              width: 2,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Color(0xff505050),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),
                    if (controller.recordedFilePath == null ||
                        controller.recordedFilePath!.isEmpty)
                      /// Record mic
                      Center(
                        child: Center(
                          child: Column(
                            children: [
                              Obx(() {
                                return GestureDetector(
                                  onPanDown: (_) => controller.startRecording(),
                                  onPanEnd: (_) => controller.stopRecording(),

                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 150),
                                    height: controller.isRecording.value
                                        ? 90
                                        : 80,
                                    width: controller.isRecording.value
                                        ? 90
                                        : 80,

                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: controller.isRecording.value
                                            ? Colors.red
                                            : const Color(0xff505050),
                                        width: 3,
                                      ),
                                      color: controller.isRecording.value
                                          ? Colors.redAccent.withOpacity(0.7)
                                          : const Color(0xffEEBCBC),
                                      boxShadow: controller.isRecording.value
                                          ? [
                                              BoxShadow(
                                                color: Colors.redAccent
                                                    .withOpacity(0.5),
                                                blurRadius: 20,
                                                spreadRadius: 5,
                                              ),
                                            ]
                                          : [],
                                    ),

                                    child: Center(
                                      child: Image.asset(
                                        "assets/images/mic.png",
                                        height: controller.isRecording.value
                                            ? 40
                                            : 30,
                                      ),
                                    ),
                                  ),
                                );
                              }),

                              const SizedBox(height: 10),
                              Obx(
                                () => Text(
                                  controller.seconds.value > 0
                                      ? "Recording: ${controller.seconds.value}s"
                                      : 'Hold Record button (Max 30s)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    if (controller.recordedFilePath != null &&
                        controller.recordedFilePath!.isNotEmpty)
                      Column(
                        children: [
                          Center(
                            child: GestureDetector(
                              onTap: () async {
                                log("Shah");
                                if (controller.recordedFilePath != null) {
                                  log("Shah");
                                  await controller.player.setFilePath(
                                    controller.recordedFilePath!,
                                  );
                                  log("Shah");
                                  controller.player.play();
                                  log("Shah");
                                }
                              },
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    color: Color(0xff505050),
                                    width: 2,
                                  ),
                                  color: Color(0xffEEBCBC),
                                ),
                                child: Image.asset("assets/images/speaker.png"),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Center(
                            child: const Text(
                              'Tap the speaker to hear your voice!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Center(
                            child: ElevatedButton(
                              onPressed: controller.redoRecording,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                minimumSize: Size(285, 50),
                              ),
                              child: Text(
                                "Redo",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff505050),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                if (controller.recordedFilePath != null &&
                                    controller.recordedFilePath!.isNotEmpty) {
                                  controller.uploadAudio(
                                    controller.recordedFilePath ?? '',
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffC672A5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                minimumSize: Size(285, 50),
                              ),
                              child: Text(
                                "Save",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
