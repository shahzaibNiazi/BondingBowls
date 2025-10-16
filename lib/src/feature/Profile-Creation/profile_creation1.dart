// // import 'dart:developer';

// // import 'package:convo_hearts/Profile-Creation/profile_creation2.dart';
// // import 'package:convo_hearts/food-discount/discount-profile.dart';
// // import 'package:flutter/material.dart';

// // class ProfileCreation extends StatefulWidget {
// //   const ProfileCreation({Key? key}) : super(key: key);

// //   @override
// //   State<ProfileCreation> createState() => _ProfileCreationState();
// // }

// // class _ProfileCreationState extends State<ProfileCreation> {

// //   void selectFoodDiscounts() {
// //     // Handle food discounts selection
// //     log("PP 1Food discounts selected");
// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(
// //         builder: (context) => ProfileDiscount() )
// //       );
// //   }

// //   void selectDatingFriends() {
// //     // Handle dating/friends selection
// //     log("Dating & friends selected");
// //     // Navigate to next page
// //       Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileCreation2()));
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: SafeArea(
// //         child: SingleChildScrollView(
// //           physics: const BouncingScrollPhysics(),
// //           child: Padding(
// //             padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Padding(
// //                   padding: const EdgeInsets.symmetric(horizontal: 35.0 , vertical: 20),
// //                   child: Center(
// //                     child: Text(
// //                       "How would you like to use\nthe Bonding Bowls App?",
// //                       textAlign: TextAlign.center,
// //                       style: TextStyle(
// //                         fontSize: 24,
// //                         fontWeight: FontWeight.w700,
// //                         color: Color(0xff0087A7),
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //                 SizedBox(height: 32),

// //                 RichText(
// //                   text: TextSpan(
// //                     text: "I'm just looking for ",
// //                     style: const TextStyle(
// //                       color: Color(0xFF6C757D),
// //                       fontSize: 16,
// //                     ),
// //                     children: [
// //                       TextSpan(
// //                         text: "Food discounts 🤑",
// //                         style: const TextStyle(
// //                           color: Color.fromARGB(255, 255, 26, 26),
// //                           fontWeight: FontWeight.w600,
// //                           fontSize: 16,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),

// //                 Text(
// //                   "(free for all users without any further verification)",
// //                   style: TextStyle( fontStyle: FontStyle.italic,fontSize: 14, color: Colors.grey[700]),
// //                 ),
// //                 SizedBox(height: 18),
// //                 Text("• Newsletter", style: TextStyle( color: Colors.grey[700])),
// //                 Text("• Last minute food discounts from food vendors (notifications)", style: TextStyle( color: Colors.grey[700])),
// //                 SizedBox(height: 23),
// //                 Center(
// //                   child: ElevatedButton(
// //                     style: ElevatedButton.styleFrom(
// //                         minimumSize: const Size(370, 50),
// //                       backgroundColor: Colors.orange,
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(20),
// //                       ),
// //                       padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
// //                     ),
// //                     onPressed: selectFoodDiscounts,
// //                     child: Text(
// //                       "Just food discounts!",
// //                       style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
// //                     ),
// //                   ),
// //                 ),
// //                 SizedBox(height: 72),

// //                 RichText(
// //                   text: TextSpan(
// //                     text: "I'm looking for ",
// //                     style: const TextStyle(
// //                       color: Color(0xFF6C757D),
// //                       fontSize: 16,
// //                     ),
// //                     children: [
// //                       TextSpan(
// //                         text: "Dating/friends 🕺💃",
// //                         style: const TextStyle(
// //                           color: Color.fromARGB(255, 255, 26, 26),
// //                           fontWeight: FontWeight.w600,
// //                           fontSize: 16,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),

// //                 Text(
// //                   "(further verification needed after profile setup 🔐)",
// //                   style: TextStyle(fontSize: 14, color: Colors.grey[700]),
// //                 ),
// //                 SizedBox(height: 14),
// //                 Text("Try our unique dating feature which eliminates all toxicity from the local dating scene.",style: TextStyle(fontSize: 14, color: Colors.grey[700])),
// //                 SizedBox(height: 8),
// //                 Text("We believe in matching people through their inner beauty, while ensuring every interaction is safe and secure.", style: TextStyle(fontSize: 14, color: Colors.grey[700])),
// //                 SizedBox(height: 8),
// //                 Text("Once you're in, you'll explore and connect through avatars, pseudonyms, and authentic conversations.", style: TextStyle(fontSize: 14, color: Colors.grey[700])),
// //                 Text("Ready to get started?", style: TextStyle(fontSize: 14, color: Colors.grey[700])),
// //                 SizedBox(height: 60),
// //                 Center(
// //                   child: ElevatedButton(
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: Color(0xffC672A5),
// //                       minimumSize: const Size(370, 50),
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(12),
// //                       ),
// //                       padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
// //                     ),
// //                     onPressed: selectDatingFriends,
// //                     child: Text(
// //                       "Dating & friends!",
// //                       style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.w700,color: Colors.white),
// //                     ),
// //                   ),
// //                 ),
// //                 SizedBox(height: 40),
// //                 Center(
// //                   child:RichText(
// //                     text: TextSpan(
// //                       text: "P.S.",
// //                       style: const TextStyle(
// //                          fontStyle: FontStyle.italic,
// //                         color: Color.fromARGB(255, 0, 0, 0),
// //                         fontSize: 16,
// //                         fontWeight: FontWeight.w700
// //                       ),
// //                       children: [
// //                         TextSpan(
// //                           text: " Fear not, You can always change your mind later!",
// //                           style: const TextStyle(
// //                             color: Color.fromARGB(255, 0, 0, 0),
// //                             fontWeight: FontWeight.w400,
// //                              fontStyle: FontStyle.italic,
// //                             fontSize: 16,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 SizedBox(height: 20),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'dart:developer';

// import 'package:convo_hearts/BottomBar/bottom_bar.dart';
// import 'package:convo_hearts/Profile-Creation/profile_creation2.dart';
// import 'package:convo_hearts/food-discount/discount-profile.dart';
// import 'package:flutter/material.dart';

// class ProfileCreation extends StatefulWidget {
//   const ProfileCreation({Key? key}) : super(key: key);

//   @override
//   State<ProfileCreation> createState() => _ProfileCreationState();
// }

// class _ProfileCreationState extends State<ProfileCreation> {

//   void selectFoodDiscounts() {
//     // Handle food discounts selection
//     log("PP 1Food discounts selected");
//     // Navigate to BottomNavBar and show ProfileDiscount as Profile page
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) => BottomNavBar(
//           initialIndex: 4, // Profile tab index
//           showDiscountProfile: true, // Flag to show discount profile
//         ),
//       ),
//     );
//   }

//   void selectDatingFriends() {
//     // Handle dating/friends selection
//     log("Dating & friends selected");
//     // Navigate to BottomNavBar with default screens
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) => BottomNavBar(
//           initialIndex: 0, // Matches tab index
//           showDiscountProfile: false, // Show normal screens
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 35.0 , vertical: 20),
//                   child: Center(
//                     child: Text(
//                       "How would you like to use\nthe Bonding Bowls App?",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.w700,
//                         color: Color(0xff0087A7),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 32),

//                 RichText(
//                   text: TextSpan(
//                     text: "I'm just looking for ",
//                     style: const TextStyle(
//                       color: Color(0xFF6C757D),
//                       fontSize: 16,
//                     ),
//                     children: [
//                       TextSpan(
//                         text: "Food discounts 🤑",
//                         style: const TextStyle(
//                           color: Color.fromARGB(255, 255, 26, 26),
//                           fontWeight: FontWeight.w600,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 Text(
//                   "(free for all users without any further verification)",
//                   style: TextStyle( fontStyle: FontStyle.italic,fontSize: 14, color: Colors.grey[700]),
//                 ),
//                 SizedBox(height: 18),
//                 Text("• Newsletter", style: TextStyle( color: Colors.grey[700])),
//                 Text("• Last minute food discounts from food vendors (notifications)", style: TextStyle( color: Colors.grey[700])),
//                 SizedBox(height: 23),
//                 Center(
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         minimumSize: const Size(370, 50),
//                       backgroundColor: Colors.orange,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                     ),
//                     onPressed: selectFoodDiscounts,
//                     child: Text(
//                       "Just food discounts!",
//                       style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 72),

//                 RichText(
//                   text: TextSpan(
//                     text: "I'm looking for ",
//                     style: const TextStyle(
//                       color: Color(0xFF6C757D),
//                       fontSize: 16,
//                     ),
//                     children: [
//                       TextSpan(
//                         text: "Dating/friends 🕺💃",
//                         style: const TextStyle(
//                           color: Color.fromARGB(255, 255, 26, 26),
//                           fontWeight: FontWeight.w600,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 Text(
//                   "(further verification needed after profile setup 🔐)",
//                   style: TextStyle(fontSize: 14, color: Colors.grey[700]),
//                 ),
//                 SizedBox(height: 14),
//                 Text("Try our unique dating feature which eliminates all toxicity from the local dating scene.",style: TextStyle(fontSize: 14, color: Colors.grey[700])),
//                 SizedBox(height: 8),
//                 Text("We believe in matching people through their inner beauty, while ensuring every interaction is safe and secure.", style: TextStyle(fontSize: 14, color: Colors.grey[700])),
//                 SizedBox(height: 8),
//                 Text("Once you're in, you'll explore and connect through avatars, pseudonyms, and authentic conversations.", style: TextStyle(fontSize: 14, color: Colors.grey[700])),
//                 Text("Ready to get started?", style: TextStyle(fontSize: 14, color: Colors.grey[700])),
//                 SizedBox(height: 60),
//                 Center(
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xffC672A5),
//                       minimumSize: const Size(370, 50),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                     ),
//                     onPressed: selectDatingFriends,
//                     child: Text(
//                       "Dating & friends!",
//                       style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.w700,color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 40),
//                 Center(
//                   child:RichText(
//                     text: TextSpan(
//                       text: "P.S.",
//                       style: const TextStyle(
//                          fontStyle: FontStyle.italic,
//                         color: Color.fromARGB(255, 0, 0, 0),
//                         fontSize: 16,
//                         fontWeight: FontWeight.w700
//                       ),
//                       children: [
//                         TextSpan(
//                           text: " Fear not, You can always change your mind later!",
//                           style: const TextStyle(
//                             color: Color.fromARGB(255, 0, 0, 0),
//                             fontWeight: FontWeight.w400,
//                              fontStyle: FontStyle.italic,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:convo_hearts/src/feature/Profile-Creation/profile_creation2.dart';
import 'package:flutter/material.dart';

import '../BottomBar/bottom_bar.dart';

class ProfileCreation extends StatefulWidget {
  const ProfileCreation({Key? key}) : super(key: key);

  @override
  State<ProfileCreation> createState() => _ProfileCreationState();
}

class _ProfileCreationState extends State<ProfileCreation> {
  void selectFoodDiscounts() {
    // Handle food discounts selection
    log("PP 1Food discounts selected");
    // Navigate to BottomNavBar and show ProfileDiscount as Profile page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BottomNavBar(
          initialIndex: 4, // Profile tab index
          showDiscountProfile: true, // Flag to show discount profile
        ),
      ),
    );
  }

  void selectDatingFriends() {
    // Handle dating/friends selection
    log("Dating & friends selected");
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ProfileCreation2()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 35.0,
                    vertical: 20,
                  ),
                  child: Center(
                    child: Text(
                      "How would you like to use the Bonding Bowls App?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff0087A7),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Food Discounts Section
                _buildSectionTitle(
                  "I'm just looking for ",
                  "Food discounts 🤑",
                ),

                Text(
                  "(free for all users without any further verification)",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                    color: Color(0xff505050),
                  ),
                ),
                const SizedBox(height: 18),

                _buildFeatureList([
                  " Newsletter",
                  " Last minute food discounts from food vendors (notifications)",
                ]),

                const SizedBox(height: 23),

                _buildActionButton(
                  text: "Just food discounts!",
                  color: Colors.orange,
                  onPressed: selectFoodDiscounts,
                  borderRadius: 20,
                ),

                const SizedBox(height: 72),

                // Dating/Friends Section
                _buildSectionTitle("I'm looking for ", "Dating/friends 🕺💃"),

                Text(
                  "(further verification needed after profile setup 🔐)",
                  style: TextStyle(color: Color(0xff505050), fontSize: 16),
                ),
                const SizedBox(height: 14),

                _buildDescriptionText([
                  "Try our unique dating feature which eliminates all toxicity from the local dating scene.",
                  "We believe in matching people through their inner beauty, while ensuring every interaction is safe and secure.",
                  "Once you're in, you'll explore and connect through avatars, pseudonyms, and authentic conversations.",
                  "Ready to get started?",
                ]),

                const SizedBox(height: 60),

                _buildActionButton(
                  text: "Dating & friends!",
                  color: Color(0xffC672A5),
                  onPressed: selectDatingFriends,
                  borderRadius: 12,
                ),

                const SizedBox(height: 40),

                // Footer Note
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "P.S.",
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      children: [
                        TextSpan(
                          text:
                              " Fear not, You can always change your mind later!",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build section titles
  Widget _buildSectionTitle(String prefix, String highlight) {
    return RichText(
      text: TextSpan(
        text: prefix,
        style: const TextStyle(
          color: Color(0xFF505050),
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
        children: [
          TextSpan(
            text: highlight,
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 26, 26),
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build feature lists
  Widget _buildFeatureList(List<String> features) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: features
          .map(
            (feature) => Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                "• $feature",
                style: TextStyle(color: Color(0xff505050), fontSize: 16),
              ),
            ),
          )
          .toList(),
    );
  }

  // Helper method to build description text blocks
  Widget _buildDescriptionText(List<String> descriptions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: descriptions
          .map(
            (description) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                description,
                style: TextStyle(color: Color(0xff505050), fontSize: 16),
              ),
            ),
          )
          .toList(),
    );
  }

  // Helper method to build action buttons
  Widget _buildActionButton({
    required String text,
    required Color color,
    required VoidCallback onPressed,
    required double borderRadius,
  }) {
    return Center(
      child: SizedBox(
        width: 370,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            elevation: 2,
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

// Example of how to fix the Flexible/Wrap issue if you have a _FlagChip widget
class FlagChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  const FlagChip({
    Key? key,
    required this.label,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.only(right: 8, bottom: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey[400]!,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

// Example of correct usage with Wrap (NO Flexible inside Wrap)
class ChipSelector extends StatefulWidget {
  final List<String> options;
  final List<String> selectedOptions;
  final Function(List<String>) onSelectionChanged;

  const ChipSelector({
    Key? key,

    required this.options,
    required this.selectedOptions,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  State<ChipSelector> createState() => _ChipSelectorState();
}

class _ChipSelectorState extends State<ChipSelector> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: widget.options.map((option) {
        final isSelected = widget.selectedOptions.contains(option);
        return FlagChip(
          // ✅ Direct child of Wrap, no Flexible wrapper
          label: option,
          isSelected: isSelected,
          onTap: () {
            setState(() {
              if (isSelected) {
                widget.selectedOptions.remove(option);
              } else {
                widget.selectedOptions.add(option);
              }
              widget.onSelectionChanged(widget.selectedOptions);
            });
          },
        );
      }).toList(),
    );
  }
}

// If you need flexible behavior, use Row/Column instead of Wrap
class FlexibleChipSelector extends StatelessWidget {
  final List<String> options;

  const FlexibleChipSelector({Key? key, required this.options})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // ✅ Use Row/Column for Flexible children
      children: [
        Expanded(
          // ✅ Use Expanded instead of Flexible when possible
          flex: 2,
          child: FlagChip(label: options.first),
        ),
        const SizedBox(width: 8),
        Flexible(
          // ✅ Now Flexible is properly inside Row
          flex: 1,
          child: FlagChip(label: options.length > 1 ? options[1] : ''),
        ),
      ],
    );
  }
}
