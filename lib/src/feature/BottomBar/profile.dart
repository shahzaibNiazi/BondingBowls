
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../settings/settings.dart';


class MyProfileScreen extends StatelessWidget {


   const MyProfileScreen({Key? key}) : super(key: key);

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
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Center(
                        child: const Text(
                          'My Profile',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=> SettingsScreen())
                          );
                      },
                      icon: SvgPicture.asset("assets/icon/svg/settings.svg")
                    ),
                  ],
                ),
              ),

              // Main profile card
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
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
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'User-ID',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
               
                    const SizedBox(height: 30),

                    // Profile Avatar
                    Container(
                      padding: const EdgeInsets.all(8),
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
                        _buildProfileRow('Nationality', '?'),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: _buildProfileDetail('Age', '?'),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: _buildProfileDetail('Gender', '?'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: _buildProfileDetail('Race', '?'),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: _buildProfileDetail('Status', '?'),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),


                    LayoutBuilder(
                      builder: (context, constraints) {
                        // Determine how many icons can fit horizontally
                        double iconWidth = 15; // You can adjust this based on the actual SVG size
                        int iconCount = (constraints.maxWidth / iconWidth).floor();

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
                          child:
                          Row(
                            children: [
                                Expanded(
                                  child: Center(
                                    child: Column(
                                      
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                    _buildIconText("assets/icon/svg/smoke.svg", "Non - Smoker"),
                                    _buildIconText("assets/icon/svg/ocasstional.svg", "Occasional Drinker"),
                                    _buildIconText("assets/icon/svg/pet.svg", "No Pets"),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15,),
                                Expanded(
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                    
                                    _buildIconText("assets/icon/svg/fre.svg", "Frequent Clubber"),
                                    _buildIconText("assets/icon/svg/serious.svg", "Serious"),
                                    _buildIconText("assets/icon/svg/location1.svg", "North - East"),
                                      ]
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
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      child:  Text(
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
                        children:  [
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
                    SizedBox(
                        height: 20,
                      ),
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
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
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
                // ✅ FIXED: Removed Flexible wrapping Wrap
                Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: const [
                      _FlagChip(label: "Trustworthy & Honest", backgroundColor: Colors.green),
                      _FlagChip(label: "Open Communication", backgroundColor: Colors.green),
                    ],
                  ),
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
                // ✅ FIXED: Removed Flexible wrapping Wrap
                Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    spacing: 5,
                    runSpacing: 3,
                    children: const [
                      _FlagChip(label: "Bad Time Management", backgroundColor: Colors.red),
                      _FlagChip(label: "Bad Time Management", backgroundColor: Colors.red),
                      _FlagChip(label: "Bad Time Management", backgroundColor: Colors.red),
                    ],
                  ),
                )
                  ],
                )
              ],
            ))]))));
          }
        }

// ✅ FIXED: Removed Flexible from _FlagChip widget
class _FlagChip extends StatelessWidget {
  final String label;
  final Color backgroundColor;

  const _FlagChip({
    required this.label,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    // ✅ FIXED: Removed Flexible wrapper - now just returns Container directly
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
        ),
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
        SvgPicture.asset(
          iconPath,
          width: 18,
          height: 18,
        ),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              decoration:
                  underline ? TextDecoration.underline : TextDecoration.none,
            ),
          ),
        ),
      ],
    );
  }