import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HotelDetailScreen extends StatefulWidget {
  const HotelDetailScreen({super.key});

  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  bool isLiked = false;
  int currentBottomNavIndex =
      1; // Set to Newsletter tab since this is detail content

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEEDA),
      body: SafeArea(
        child: Column(
          children: [
            // Top Header Section
            SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[400]!),
              ),
              child: Center(
                child: Text(
                  '~Slideshow Ads Space',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.sp,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),

            // Navigation Header

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(
                          0xFFEADBC8,
                        ), // light beige background
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black54),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              "20% off on all Macdonald's item\nT&C applies",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(
                                0xFF1361E0,
                              ), // Blue button
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              "Claim",
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        // Back button positioned on the left
                        Positioned(
                          left: 10,
                          child: IconButton(
                            icon: SvgPicture.asset(
                              "assets/icon/svg/back_arrow.svg",
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        // Title centered
                        Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Macdonalds',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),

                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFEEDA),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "assets/images/Rectangle 121.png",
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Food",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Location and Rating
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Text(
                            "Average Price: \$15-25",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "20 views",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    Center(
                      child: Text(
                        "Best Western Food in the West?",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Food Image 1
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/food.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Description Text
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black87,
                          height: 1.5,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Food Image 2
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/food.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // More Description Text
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black87,
                          height: 1.5,
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    //                     // Restaurant Info Section
                    //                     Padding(
                    //                       padding: const EdgeInsets.symmetric(horizontal: 16),
                    //                       child: Column(
                    //                         crossAxisAlignment: CrossAxisAlignment.start,
                    //                         children: [

                    // Row(
                    //   children: [
                    //       Container(
                    //                             margin: const EdgeInsets.symmetric(horizontal: 8),
                    //                             height: 70,
                    //                             decoration: BoxDecoration(
                    //                               borderRadius: BorderRadius.circular(12),
                    //                             ),
                    //                             child: Image.asset("assets/images/food.png"),
                    //                           ),

                    //                     Column(
                    //                       mainAxisAlignment: MainAxisAlignment.start,
                    //                       children: [
                    //                         const Text(
                    //                             'Macdonald',
                    //                             style: TextStyle(
                    //                               fontSize: 18,
                    //                               fontWeight: FontWeight.w600,
                    //                               color: Colors.black87,
                    //                             ),
                    //                           ),
                    //                           const SizedBox(height: 2),
                    //                           // Rating row
                    //                           Row(
                    //                             children: [
                    //                               const Icon(
                    //                                 Icons.star,
                    //                                 color: Colors.amber,
                    //                                 size: 16,
                    //                               ),
                    //                               const SizedBox(width: 4),
                    //                               const Text(
                    //                                 '4.8',
                    //                                 style: TextStyle(
                    //                                   fontSize: 14,
                    //                                   fontWeight: FontWeight.w500,
                    //                                   color: Colors.black87,
                    //                                 ),
                    //                               ),
                    //                               const SizedBox(width: 4),
                    //                               Text(
                    //                                 '(234 reviews)',
                    //                                 style: TextStyle(
                    //                                   fontSize: 14,
                    //                                   color: Colors.grey[600],
                    //                                 ),
                    //                               ),
                    //                             ],
                    //                           ),
                    //                           const SizedBox(height: 4),
                    //                           // Location
                    //                           Row(
                    //                             children: [
                    //                               Icon(
                    //                                 Icons.location_on_outlined,
                    //                                 size: 14,
                    //                                 color: Colors.grey[600],
                    //                               ),
                    //                               const SizedBox(width: 4),
                    //                               Text(
                    //                                 'North',
                    //                                 style: TextStyle(
                    //                                   fontSize: 14,
                    //                                   color: Colors.grey[600],
                    //                                 ),
                    //                               ),
                    //                             ],
                    //                           ),
                    //                           const SizedBox(height: 2),
                    //                           // Address link
                    //                           GestureDetector(
                    //                             onTap: () {
                    //                               // Handle address tap
                    //                             },
                    //                             child: const Text(
                    //                               '#912 Bukit batok crescent (634498)',
                    //                               style: TextStyle(
                    //                                 fontSize: 12,
                    //                                 color: Colors.blue,
                    //                                 decoration: TextDecoration.underline,
                    //                               ),
                    //                             ),
                    //                           ),
                    //                           const SizedBox(height: 16),
                    //                       ],
                    //                     )

                    //   ],
                    // ),

                    //                           // Opening Hours section
                    //                           const Text(
                    //                             'Opening Hours :',
                    //                             style: TextStyle(
                    //                               fontSize: 16,
                    //                               fontWeight: FontWeight.w600,
                    //                               color: Colors.black87,
                    //                             ),
                    //                           ),
                    //                           const SizedBox(height: 12),
                    //                           // Opening hours list
                    //                           Column(
                    //                             children: [
                    //                               _buildOpeningHoursRow('Sunday', 'closed', isToday: false),
                    //                               _buildOpeningHoursRow('Monday', '11:00AM - 11:30PM', isToday: false),
                    //                               _buildOpeningHoursRow('Tuesday', '11:00AM - 11:30PM', isToday: false),
                    //                               _buildOpeningHoursRow('Wednesday', '11:00AM - 11:30PM', isToday: false),
                    //                               _buildOpeningHoursRow('Thursday', '11:00AM - 11:30PM', isToday: false),
                    //                               _buildOpeningHoursRow('Friday', '1:00PM - 12:00AM', isToday: false),
                    //                               _buildOpeningHoursRow('Saturday', '1:00PM - 12:00AM', isToday: true),
                    //                             ],
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ),

                    // Restaurant Info Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 12),
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ), // increased for more roundness
                                  image: const DecorationImage(
                                    image: AssetImage("assets/images/food.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              SizedBox(width: 40),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Macdonald',
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 4),

                                    // Stack(
                                    //   children:[
                                    //         Container(
                                    //           decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/Rectangle 121.png"))),
                                    //         ),
                                    //         Center(
                                    //           child: Text("Food"),
                                    //         )
                                    //         ]

                                    // ),

                                    // Rating row
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 18),
                                        Text(
                                          '4.8',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '(234 reviews)',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 18),
                                    // Location
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          size: 14,
                                          color: Colors.grey[600],
                                        ),
                                        const SizedBox(width: 18),
                                        Text(
                                          'North',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 2),

                                    // Address link
                                    GestureDetector(
                                      onTap: () {
                                        // Handle address tap
                                      },
                                      child: Text(
                                        '#01-2 Bukit batok cresent (638498)',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),

                          // Opening Hours section

                          // Opening hours list
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Opening Hours :',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 40),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Opening Hours :',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        buildOpeningHoursTable(context),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 100,
                    ), // Extra space for bottom navigation
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Add the CurvedBottomNavigationBar here
    );
  }

  // Widget _buildHourRow(String day, String hours, {bool isClosed = false}) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 4.0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text(
  //           day,
  //           style: const TextStyle(
  //             fontSize: 13,
  //             fontWeight: FontWeight.w400,
  //             color: Color(0xff000000),
  //           ),
  //         ),
  //         Text(
  //           hours,
  //           style: TextStyle(
  //             fontSize: 13,
  //             fontWeight: FontWeight.w400,
  //             color: isClosed ? Colors.red.shade600 : Color(0xff000000),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

// Widget _buildHourRow1(String day, String hours, {bool isClosed = false}) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 4.0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           day,
//           style: const TextStyle(
//             fontSize: 13,
//             fontWeight: FontWeight.w400,
//             color: Color(0xff000000),
//           ),
//         ),
//         SizedBox(width: 70),
//         Text(
//           hours,
//           style: TextStyle(
//             fontSize: 13,
//             fontWeight: FontWeight.w400,
//             color: isClosed ? Colors.red.shade600 : Color(0xff000000),
//           ),
//         ),
//       ],
//     ),
//   );
// }

Widget buildOpeningHoursTable(BuildContext context) {
  final openingHours = [
    ['Sunday', 'Closed', true],
    ['Monday', '11:00AM - 11:30PM', false],
    ['Tuesday', '11:00AM - 11:30PM', false],
    ['Wednesday', '11:00AM - 11:30PM', false],
    ['Thursday', '11:00AM - 11:30PM', false],
    ['Friday', '1:00PM - 12:00AM', false],
    ['Saturday', '1:00PM - 12:00AM', false],
  ];

  // Find the longest time string (for consistent alignment of 'closed')
  final longestTime = openingHours
      .map((e) => e[1] as String)
      .reduce((a, b) => a.length > b.length ? a : b);

  // Measure text width of the longest timing
  final textPainter = TextPainter(
    text: TextSpan(
      text: longestTime,
      style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
    ),
    textDirection: TextDirection.ltr,
  )..layout();

  final timeColumnWidth = textPainter.width + 4; // small padding

  return LayoutBuilder(
    builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: openingHours.map((row) {
          final day = row[0] as String;
          final hours = row[1] as String;
          final isClosed = row[2] as bool;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // --- Day text ---
                Expanded(
                  child: Text(
                    day,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000),
                    ),
                  ),
                ),

                // --- Time text aligned to the end ---
                SizedBox(
                  width: timeColumnWidth,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      hours,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      );
    },
  );
}

// Widget _buildOpeningHoursRow(String day, String hours, {bool isToday = false}) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 4),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           day,
//           style: TextStyle(
//             fontSize: 14,
//             color: isToday ? Colors.black87 : Colors.grey[600],
//             fontWeight: isToday ? FontWeight.w500 : FontWeight.normal,
//           ),
//         ),
//         Text(
//           hours,
//           style: TextStyle(
//             fontSize: 14,
//             color: hours == 'closed'
//               ? Colors.red[600]
//               : (isToday ? Colors.black87 : Colors.grey[700]),
//             fontWeight: isToday ? FontWeight.w500 : FontWeight.normal,
//           ),
//         ),
//       ],
//     ),
//   );
// }

// Helper method for opening hours rows
