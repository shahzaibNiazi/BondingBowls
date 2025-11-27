import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tts/flutter_tts.dart';

class SpeakablePrompt extends StatefulWidget {
  final String text;
  const SpeakablePrompt({super.key, required this.text});

  @override
  State<SpeakablePrompt> createState() => _SpeakablePromptState();
}

class _SpeakablePromptState extends State<SpeakablePrompt> {
  final FlutterTts flutterTts = FlutterTts();
  bool isSpeaking = false;

  Future<void> _speak() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1.0);

    if (isSpeaking) {
      await flutterTts.stop();
      setState(() => isSpeaking = false);
    } else {
      setState(() => isSpeaking = true);
      await flutterTts.speak(widget.text);
      flutterTts.setCompletionHandler(() {
        setState(() => isSpeaking = false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(widget.text, style: TextStyle(fontSize: 14.sp)),
          ),
          GestureDetector(
            onTap: _speak,
            child: SvgPicture.asset(
              "assets/icon/svg/speaker_small.svg",
              color: isSpeaking ? Colors.blue : null,
            ),
          ),
        ],
      ),
    );
  }
}
