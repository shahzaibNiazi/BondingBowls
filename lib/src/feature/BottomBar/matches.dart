
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../settings/notification.dart';
import '../settings/settings.dart';

class MatchesPage extends StatelessWidget {
  const MatchesPage({Key? key}) : super(key: key);

  // TextEditingController _bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5E6D3), // Light peachy background
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header with title and settings
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotificationScreen(),
                          ),
                        );
                      },
                      icon: SvgPicture.asset(
                        "assets/icon/svg/notification.svg",
                      ),
                    ),

                    SizedBox(
                      height: 90,
                      width: 200,
                    child: Image.asset("assets/icon/logo/bonding bowl no background.png")),

                   Column(
                    children: [
                       IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingsScreen(),
                          ),
                        );
                      },
                      icon: SvgPicture.asset("assets/icon/svg/bowl.svg"),
                    ),
                    Text("300",style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700
                    ))
                    
                    ],
                   )
                  ],
                ),
              ),
                // Slideshow ads space banner
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[400]!),
              ),
              child: const Center(
                child: Text(
                  '~Slideshow Ads Space',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
              // Main profile card
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xffC672A5)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // User-ID and Boost Profile section
                    Align(
                      alignment: Alignment.centerRight,
                      child: SvgPicture.asset("assets/icon/svg/tri_info.svg"),
                    ),

          

                    // Profile Avatar
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal:  8),
                      child: Image.asset(
                        'assets/images/female-avatar.jpg', // Replace with your avatar image
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Name
                    const Text(
                      'Nicole',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffFF0000),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Color(0xffC672A5), width: 2),
                      ),
                      child: Text(
                        "SingPass",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    const Text(
                      'Software Engineer | Coffee Enthusiast | Yoga lover',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFFBC0072),
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Profile Details
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildProfileRow('Nationality', 'Singaporean'),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(child: _buildProfileDetail('Age', '22')),
                            const SizedBox(width: 20),
                            Expanded(
                              child: _buildProfileDetail('Gender', 'Female'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: _buildProfileDetail('Race', 'Chinese'),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: _buildProfileDetail('Status', 'Single'),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    LayoutBuilder(
                      builder: (context, constraints) {
                        // Determine how many icons can fit horizontally
                        double iconWidth =
                            15; // You can adjust this based on the actual SVG size
                        int iconCount = (constraints.maxWidth / iconWidth)
                            .floor();

                        return Wrap(
                          spacing: 0, // no space between icons
                          runSpacing: 0,
                          children: List.generate(iconCount, (index) {
                            return SvgPicture.asset(
                              "assets/icon/svg/bowl.svg",
                              width: iconWidth,
                            );
                          }),
                        );
                      },
                    ),

                    const Center(
                      child: Text(
                        "Nitty - Gritty",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Row 1
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildIconText(
                                    "assets/icon/svg/smoke.svg",
                                    "Non - Smoker",
                                  ),
                                  _buildIconText(
                                    "assets/icon/svg/ocasstional.svg",
                                    "Occasional Drinker",
                                  ),
                                  _buildIconText(
                                    "assets/icon/svg/pet.svg",
                                    "No Pets",
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildIconText(
                                    "assets/icon/svg/fre.svg",
                                    "Frequent Clubber",
                                  ),
                                  _buildIconText(
                                    "assets/icon/svg/serious.svg",
                                    "Serious",
                                  ),
                                  _buildIconText(
                                    "assets/icon/svg/location1.svg",
                                    "North - East",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Religion
                    const Text(
                      "Religion: Hinduism",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xfff2dede), // light pink/red
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      child: Text(
                        "Voice Prompts :",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 12,
                      ),
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
                            child: Text(
                              "What do i think of first dates?",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          SvgPicture.asset("assets/icon/svg/speaker_small.svg"),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 12,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xfff2dede), // light pink
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: const Text(
                              "Bio :",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child:
                                // TextFormField(
                                //     controller: _bioController,
                                //     maxLines: null, // allows multiline
                                //     minLines: 10, // initial height
                                //     keyboardType: TextInputType.multiline,
                                //     decoration: InputDecoration(
                                //       // labelText: "About You",
                                //       alignLabelWithHint: true,
                                //       // border: OutlineInputBorder(),
                                //     ),
                                //     style: const TextStyle(fontSize: 14),
                                //   ),
                                const Text(
                                  "Hi! I'm someone who loves meaningful conversations, spontaneous adventures, and the little things in life. Whether it's deep talks over coffee or laughing at silly memes, I'm all in. Looking to meet someone genuine, kind, and curious. Let's explore connections beyond just swipes.",
                                  style: TextStyle(fontSize: 14),
                                ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Green Flags
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Green Flags",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children: const [
                                  _FlagChip(
                                    label: "Trustworthy & Honest",
                                    backgroundColor: Colors.green,
                                  ),
                                  _FlagChip(
                                    label: "Open Communication",
                                    backgroundColor: Colors.green,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Red Flags
                        Align(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Red Flags",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Wrap(
                                spacing: 10,
                                children: const [
                                  _FlagChip(
                                    label: "Bad Time Management",
                                    backgroundColor: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                      SizedBox(height: 20,),

                      Column(
                        children: [
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Bowl Crush remaining : 6",
                                style: TextStyle(
                                  color: Color(0xffEB5230),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700
                                ),)
                              ],
                            ),
                          ),

                          SizedBox(height: 20,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset("assets/images/thumbs.png"),
                              Image.asset("assets/images/match_logo.png"),
                              Image.asset("assets/images/thumbs_down.png")

                            ],
                          )


                        ],
                      ),

                    SizedBox(height: 200,)

                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FlagChip extends StatelessWidget {
  final String label;
  final Color backgroundColor;

  const _FlagChip({required this.label, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 10),
      ),
    );
  }
}

Widget _buildProfileRow(String label, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        '$label : ',
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      Text(
        value,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
    ],
  );
}

Widget _buildProfileDetail(String label, String value) {
  return Center(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label : ',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}

Widget _buildIconText(String iconPath, String text, {bool underline = false}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      SvgPicture.asset(iconPath, width: 18, height: 18),
      const SizedBox(width: 6),
      Flexible(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            decoration: underline
                ? TextDecoration.underline
                : TextDecoration.none,
          ),
        ),
      ),
    ],
  );
}










class SmoothCurvedBottomBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final path = Path();

    final double centerX = size.width / 2;
    final double cornerRadius = 20.0;
    final double ovalWidth = 120.0;  // Width of the oval cutout
    final double ovalDepth = 20.0;   // Shallow depth for subtle curve
    
    // Create main rectangle with rounded corners
    path.moveTo(0, size.height);
    path.lineTo(0, cornerRadius);
    path.quadraticBezierTo(0, 0, cornerRadius, 0);
    
    // Left side approaching the oval cutout
    path.lineTo(centerX - ovalWidth / 2, 0);
    
    // Create smooth oval cutout using a perfect elliptical curve
    // Left curve into oval
    path.quadraticBezierTo(
      centerX - ovalWidth / 2,
      -ovalDepth * 0.7,
      centerX - ovalWidth / 4,
      -ovalDepth,
    );
    
    // Center curve of oval (deepest part)
    path.quadraticBezierTo(
      centerX,
      -ovalDepth * 1.4,
      centerX + ovalWidth / 4,
      -ovalDepth,
    );
    
    // Right curve out of oval
    path.quadraticBezierTo(
      centerX + ovalWidth / 2,
      -ovalDepth * 0.6,
      centerX + ovalWidth / 2,
      0,
    );

    // Right side after oval
    path.lineTo(size.width - cornerRadius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, cornerRadius);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    // Draw shadow for subtle depth
    canvas.drawShadow(path, Colors.black.withOpacity(0.06), 4.0, false);
    canvas.drawPath(path, paint);

    // Very subtle border
    final borderPaint = Paint()
      ..color = const Color(0xff05050566).withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5 ;
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}