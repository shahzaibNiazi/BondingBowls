import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controllers/profile_creation_controller.dart';

class VoicePromptSecondView extends GetView<ProfileCreationController> {
  const VoicePromptSecondView({super.key});
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
                    /// Back button and title
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
                      child: const Text(
                        "Voice Prompts",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    /// Info text
                    const Text(
                      '*Voice prompts is an optional feature where you answer questions here with your voice. Your voice will be added to your profile for everyone else to hear',
                      style: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff505050),
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 24),

                    /// Input field with dynamic count

                    //     Obx(
                    //   () => TextField(
                    //     onChanged: controller.updateQuestion,
                    //     maxLength: 40,
                    //     decoration: InputDecoration(
                    //       hintText: 'What do i think of first dates?',
                    //       counterText: '', // Hides default counter
                    //       contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    //       suffix: Text(
                    //         '${controller.question.value.length}/40',
                    //         style: const TextStyle(fontSize: 12, color: Colors.black54),
                    //       ),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(20),
                    //         borderSide: BorderSide(color: Color(0xff505050))
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Obx(
                      () => TextField(
                        onChanged: controller.updateQuestion,
                        maxLength: 40,
                        decoration: InputDecoration(
                          hintText: 'What do i think of first dates?',
                          counterText: '', // Hides default counter
                          contentPadding: const EdgeInsets.fromLTRB(
                            16,
                            16,
                            16,
                            16,
                          ),
                          suffix: Text(
                            '${controller.question.value.length}/40',
                            style: const TextStyle(
                              fontSize: 12,
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

                    /// Record mic
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
