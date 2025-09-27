import 'package:convo_hearts/voice_prompt/voice_prompt2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class VoicePromptController extends GetxController {
  var question = ''.obs;

  void updateQuestion(String value) {
    if (value.length <= 40) {
      question.value = value;
    }
  }

  void startRecording() {
    // TODO: Implement voice recording start
    print("Recording started...");
  }

  void stopRecording() {
    // TODO: Implement voice recording stop
    print("Recording stopped.");
  }
}



class VoicePromptRecordScreen extends StatelessWidget {
  VoicePromptRecordScreen({super.key});

  final controller = Get.put(VoicePromptController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Back button and title
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: SvgPicture.asset("assets/icon/svg/back_arrow.svg"),
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
                  style: TextStyle(fontSize: 15, color: Color(0xff505050),
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
          
                const SizedBox(height: 24),
          
          
                  //     Obx(
                  //   () => TextField(
                  //     onChanged: controller.updateQuestion,
                  //     maxLength: 40,
                  //     decoration: InputDecoration(
                  //       focusedBorder: InputBorder(borderSide: borderRadius: BorderRadius.circular(20),),
                  //       hintText: 'Type your questions here',
                  //       counterText: '', // Hides default counter
                  //       contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                  //       suffix: Text(
                  //         '${controller.question.value.length}/40',
                  //         style: const TextStyle(fontSize: 12, color: Color(0xff505050)),
                  //       ),
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(20),
                  //         borderSide: BorderSide(color: Color(0xff505050),width: 2)
                  //       ),
                  //     ),
                  //   ),
                  // ),


                  Obx(
  () => TextField(
    onChanged: controller.updateQuestion,
    maxLength: 40,
    decoration: InputDecoration(
      hintText: 'Type your questions here',
      counterText: '', // Hides default counter
      contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      suffix: Text(
        '${controller.question.value.length}/40',
        style: const TextStyle(fontSize: 12, color: Color(0xff505050)),
      ),
      // Always 2px border
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Color(0xff505050), width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Color(0xff505050), width: 2),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Color(0xff505050), width: 2),
      ),
    ),
  ),
),

          
          
                const SizedBox(height: 40),
          
                /// Record mic
                Center(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.to(()=>VoicePrompt2RecordScreen(), transition: Transition.downToUp , duration: Duration(milliseconds: 800));
                        },
                        onLongPress: controller.startRecording,
                        onLongPressEnd: (_) => controller.stopRecording(),
                        child: Container(
                          height: 80,
                          width: 80
                          ,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Color(0xff505050), width: 2),
                            color: Color(0xffEEBCBC)
                          ),
                          child: Image.asset("assets/images/mic.png"),)
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Hold Record button for recording your answer\n(Max 30 seconds)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontStyle: FontStyle.italic,fontSize: 15,fontWeight: FontWeight.w300, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
