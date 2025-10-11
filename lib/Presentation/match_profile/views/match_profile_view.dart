import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/match_profile_controller.dart';

class MatchProfileView extends GetView<MatchProfileController> {
  const MatchProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = GoogleFonts.poppinsTextTheme();
    return Scaffold(
      backgroundColor: const Color(0xFFFDEFE3),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.pink.shade100),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// Top Bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(Icons.arrow_back, size: 28),
                      ),
                      const Icon(
                        Icons.warning_amber_rounded,
                        color: Colors.pink,
                        size: 28,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  /// Avatar & Name
                  const CircleAvatar(
                    radius: 48,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/images/AI-AVATAR.jpg'),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Nicole",
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red.shade600,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "SingPass",
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Software Engineer | Coffee Enthusiast | Yoga lover',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFFBC0072),
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// Details Section
                  _buildUserDetails(textTheme),
                  const Divider(thickness: 1),
                  const SizedBox(height: 10),

                  /// Nitty Gritty
                  Text(
                    "Nitty - Gritty",
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildNittyGritty(),

                  const SizedBox(height: 8),
                  Text("Religion: Hinduism", style: textTheme.bodyMedium),

                  const SizedBox(height: 16),

                  /// Voice Prompt
                  _buildVoicePrompt(textTheme),

                  const SizedBox(height: 16),

                  /// Bio Section
                  _buildBio(textTheme),

                  const SizedBox(height: 20),

                  /// Green & Red Flags
                  _buildFlags(textTheme),

                  const SizedBox(height: 30),

                  /// Bottom Icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCircleButton(
                        Icons.thumb_up,
                        Colors.green,
                        Colors.white,
                      ),
                      _buildCircleButton(
                        Icons.thumb_down,
                        Colors.red,
                        Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// ================== Widgets ==================

  Widget _buildUserDetails(TextTheme textTheme) {
    return Column(
      children: [
        _buildDetailRow("Nationality", "Singaporean"),
        _buildDetailRow(
          "Age",
          "22",
          rightTitle: "Gender",
          rightValue: "Female",
        ),
        _buildDetailRow(
          "Race",
          "Chinese",
          rightTitle: "Status",
          rightValue: "Single",
        ),
      ],
    );
  }

  Widget _buildDetailRow(
    String leftTitle,
    String leftValue, {
    String? rightTitle,
    String? rightValue,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$leftTitle : ",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Text(leftValue),
          if (rightTitle != null && rightValue != null) ...[
            const SizedBox(width: 30),
            Text(
              "$rightTitle : ",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            Text(rightValue),
          ],
        ],
      ),
    );
  }

  Widget _buildNittyGritty() {
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: const [
        _InfoChip(icon: Icons.smoke_free, text: "Non - Smoker"),
        _InfoChip(icon: Icons.local_bar, text: "Occasional Drinker"),
        _InfoChip(icon: Icons.nightlife, text: "Frequent Clubber"),
        _InfoChip(icon: Icons.pets_outlined, text: "No Pets"),
        _InfoChip(icon: Icons.location_on, text: "North - East"),
        _InfoChip(icon: Icons.visibility, text: "Serious"),
      ],
    );
  }

  Widget _buildVoicePrompt(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          color: Color(0xffE5D1D1),
          child: Text("Voice Prompts :", style: textTheme.bodyLarge),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("What do i think of first dates?"),
              Icon(Icons.volume_up_rounded),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBio(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          color: Color(0xffE5D1D1),
          child: Text("Bio :", style: textTheme.bodyLarge),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
          child: Text(
            "Hi! I'm someone who loves meaningful conversations, spontaneous adventures, and the little things in life. Whether it's deep talks over coffee or laughing at silly memes, I'm all in. Looking to meet someone genuine, kind, and curious. Let’s explore connections beyond just swipes.",
            style: textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }

  Widget _buildFlags(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Green Flags",
          style: textTheme.titleMedium?.copyWith(
            color: Color(0xff008000),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Wrap(
          spacing: 8,
          children: const [
            _TagChip(text: "Trustworthy & Honest", color: Color(0xff008000)),
            _TagChip(text: "Open Communication", color: Color(0xff008000)),
          ],
        ),
        const SizedBox(height: 14),
        Text(
          "Red Flags",
          style: textTheme.titleMedium?.copyWith(
            color: Colors.red.shade700,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        const _TagChip(text: "Bad Time Management", color: Colors.red),
      ],
    );
  }

  Widget _buildCircleButton(IconData icon, Color bg, Color iconColor) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
      child: Icon(icon, color: iconColor, size: 30),
    );
  }
}

/// ================== Helper Widgets ==================

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoChip({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: Colors.black87),
        const SizedBox(width: 4),
        Text(text),
      ],
    );
  }
}

class _TagChip extends StatelessWidget {
  final String text;
  final Color color;

  const _TagChip({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 12.sp),
      ),
    );
  }
}
