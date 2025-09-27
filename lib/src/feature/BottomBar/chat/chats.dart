
import 'package:convo_hearts/src/feature/BottomBar/chat/received_likes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../settings/settings.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEEDA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top half - darker peach
            Container(
              color: const Color(0xFFFFEEDA),
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: SvgPicture.asset(
                              "assets/icon/svg/back_arrow.svg",
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                "CHATS",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: "Playfair",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
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
                                icon: SvgPicture.asset(
                                  "assets/icon/svg/bowl.svg",
                                  height: 33,
                                  width: 33,
                                ),
                              ),
                              Text(
                                "300",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Slideshow ads space banner
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
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
                    Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)=>ReceivedLikesScreen()) 
                              );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Color(0xffBC0072),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.08),
                                    blurRadius: 8.0,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "Received Likes (70)",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Card List
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: Center(
                                  child: Text(
                                    "CaféConnect matches",
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffFF9500),
                                    ),
                                  ),
                                ),
                              ),

                              // Chat List Items
                              _buildChatItem(
                                name: "Alex supatra",
                                location: "25k, Chinese",
                                isOnline: true,
                                isMainMatch: true,
                                assetimage: 'assets/images/AI-AVATAR.jpg',
                                top_text: 'NRIC',
                              ),
                              SizedBox(height: 40),
                              
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    // Left divider
                                    Expanded(
                                      child: Container(
                                        height: 1,
                                        color: const Color(0xffBD5FCC),
                                      ),
                                    ),

                                    // Text with spacing
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: Text(
                                        "Main Matches",
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xffBD5FCC),
                                        ),
                                      ),
                                    ),

                                    // Right divider
                                    Expanded(
                                      child: Container(
                                        height: 1,
                                        color: const Color(0xffBD5FCC),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 20),

                              _buildChatItem(
                                name: "Alex supatra",
                                location: "25k, Chinese", 
                                isOnline: true,
                                hasNewMessage: true,
                                assetimage: 'assets/images/AI-AVATAR.jpg', 
                                top_text: 'Singpass',
                                color1: Color(0xffFF0000)
                              ),

                              SizedBox(height: 40),
                              
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    // Left divider
                                    Expanded(
                                      child: Container(
                                        height: 1,
                                        color: Color(0xff6C495E),
                                      ),
                                    ),

                                    // Text with spacing
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: Text(
                                        "System message",
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff6C495E),
                                        ),
                                      ),
                                    ),

                                    // Right divider
                                    Expanded(
                                      child: Container(
                                        height: 1,
                                        color: Color(0xff6C495E),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 20),

                              ChatItemTaco(
                                name: "SysTaco",
                                details: "1M/F, Taco",
                                badgeText: "TacoPass",
                                imagePath: "assets/images/robot_taco.jpg",
                                messageCount: "13",
                              ),

                              const SizedBox(height: 50),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatItem({
    required String name,
    required String location,
    required String assetimage,
    required String top_text,
    Color color1 = const Color(0xffE39898),
    bool isOnline = false,
    bool hasNewMessage = false,
    bool isMainMatch = false,
    // bool isSystemMessage = false,
  }) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            border: Border.all(color: Color.fromARGB(73, 0, 0, 0)),
            borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            children: [
              // Profile Picture with online indicator
              Stack(
                children: [
                  Container(
                    height: 97,
                    width: 92,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(assetimage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(width: 12),
              
              // Chat info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: color1,
                        border: Border.all(color: Color(0xffC672A5), width: 2),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Text(
                        top_text,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      location,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff000000),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    
        if (hasNewMessage)
          Positioned(
            top: -2,
            right: 9,
            child: Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Center(
                  child: Text(
                    "1",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ] 
    );
  }
}

class ChatItemTaco extends StatelessWidget {
  final String name;
  final String details;
  final String badgeText;
  final String imagePath;
  final String messageCount;

  const ChatItemTaco({
    super.key,
    required this.name,
    required this.details,
    required this.badgeText,
    required this.imagePath,
    required this.messageCount,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Main card
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          padding: const EdgeInsets.fromLTRB(80, 12, 16, 12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black26),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xffC672A5), width: 2), 
                  ),
                  child: Text(
                    badgeText,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
            
                // Name + Verified icon
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Image.asset("assets/images/verify.png")
                  ],
                ),
                const SizedBox(height: 2),
            
                // Details
                Text(
                  details,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff000000),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),

        // Character image positioned outside card
        Positioned(
          top: -5,
          left: 60,
          child: Image.asset(
            imagePath,
            height: 110,
          ),
        ),

        // Message count badge (green circle)
        // Positioned(
        //   top: -6,
        //   right: 8,
        //   child: CircleAvatar(
        //     radius: 14,
        //     backgroundColor: Colors.green,
        //     child: Text(
        //       messageCount,
        //       style: const TextStyle(
        //         color: Colors.white,
        //         fontSize: 12,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        //   ),
        // ),



        // if (hasNewMessage)
          Positioned(
            top: -2,
            right: 9,
            child: Container(
              height: 28,
              width: 28,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Center(
                  child: Text(
                    "1",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),


      ],
    );
  }
}