import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/cafeconnect_booking_details_controller.dart';

class CafeconnectBookingDetailsView
    extends GetView<CafeconnectBookingDetailsController> {
  const CafeconnectBookingDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAEEDC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAEEDC),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Booking details',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Column(
          children: [
            // Slideshow Ads Placeholder
            Container(
              height: 80.h,
              width: double.infinity,
              color: Colors.grey[300],
              alignment: Alignment.center,
              child: Text(
                '*Slideshow Ads Space',
                style: TextStyle(
                  color: Colors.purple[200],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16.h),

            // Tabs Row
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  tabItem('Bookings', controller),
                  tabItem('Available', controller),
                  tabItem('Likes you', controller),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // Cards based on selected tab
            Obx(() {
              switch (controller.selectedTab.value) {
                case 'Bookings':
                  return bookingCard();
                case 'Available':
                  return availableCard();
                case 'Likes you':
                  return likesYouCard();
                default:
                  return bookingCard();
              }
            }),
          ],
        ),
      ),
    );
  }

  // Tab Widget
  Widget tabItem(String title, CafeconnectBookingDetailsController controller) {
    bool isSelected = controller.selectedTab.value == title;
    return GestureDetector(
      onTap: () => controller.selectTab(title),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xff3F6EFF) : Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: Color(0xff3F6EFF)),
        ),
        child: Text(
          title,
          style: TextStyle(color: isSelected ? Colors.white : Colors.blue),
        ),
      ),
    );
  }

  // Booking Card
  Widget bookingCard() {
    return contentCard(
      icon: Icons.check_circle,
      iconColor: Colors.green,
      title: 'Booking Confirmed',
    );
  }

  // Available Card
  Widget availableCard() {
    // Sample data
    final profiles = [
      {
        "name": "Mary",
        "age": 38,
        "nationality": "Chinese",
        "occupation": "Software Engineer | Coffee Enthusiast | Yoga Lover",
        "lookingFor": "Male",
        "availableFor": ["Lunch", "Dinner"],
        "note": "please be punctual",
        "status": "Married Female, Singaporean",
      },
      {
        "name": "Mary",
        "age": 38,
        "nationality": "Malay",
        "occupation": "Software Engineer | Coffee Enthusiast | Yoga Lover",
        "lookingFor": "Male",
        "availableFor": ["Lunch", "Dinner"],
        "note": "please be punctual",
        "status": "- Female, Singapore PR",
      },
      {
        "name": "Mary",
        "age": 38,
        "nationality": "Russian",
        "occupation": "Software Engineer | Coffee Enthusiast | Yoga Lover",
        "lookingFor": "Male",
        "availableFor": ["Lunch", "Dinner"],
        "note": "please be punctual",
        "status": "- Female, Foreigner / WP",
      },
    ];

    return Column(
      children: profiles.map((profile) {
        return Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row: name, age, nationality, warning icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${profile['name']} ${profile['age']}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ).paddingOnly(left: 30.w),
                  Icon(Icons.warning, color: Color(0xffBC0072), size: 30.sp),
                ],
              ),
              Row(
                children: [
                  Image.asset("assets/images/girl.png", scale: 3.5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profile['nationality'].toString(),
                        style: TextStyle(fontSize: 14.sp),
                      ),

                      Text(
                        profile['occupation'].toString(),
                        style: TextStyle(fontSize: 11.sp, color: Colors.pink),
                      ),

                      SizedBox(height: 4.h),
                      Text("Looking for: ${profile['lookingFor']}"),
                      Text(
                        "Available for: ${profile['availableFor'].toString()}",
                      ),
                      Text("Note: ${profile['note']}"),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 4.h),

              SizedBox(height: 4.h),
              Text(profile['status'].toString()),
              SizedBox(height: 8.h),

              // Accept / Reject buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Image.asset('assets/images/done.png', scale: 4),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Image.asset('assets/images/cross.png', scale: 4),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // Available Card
  Widget likesYouCard() {
    // Sample data
    final profiles = [
      {
        "name": "Mary",
        "age": 38,
        "nationality": "Chinese",
        "occupation": "Software Engineer | Coffee Enthusiast | Yoga Lover",
        "lookingFor": "Male",
        "availableFor": ["Lunch", "Dinner"],
        "note": "please be punctual",
        "status": "Married Female, Singaporean",
      },
      {
        "name": "Mary",
        "age": 38,
        "nationality": "Malay",
        "occupation": "Software Engineer | Coffee Enthusiast | Yoga Lover",
        "lookingFor": "Male",
        "availableFor": ["Lunch", "Dinner"],
        "note": "please be punctual",
        "status": "- Female, Singapore PR",
      },
      {
        "name": "Mary",
        "age": 38,
        "nationality": "Russian",
        "occupation": "Software Engineer | Coffee Enthusiast | Yoga Lover",
        "lookingFor": "Male",
        "availableFor": ["Lunch", "Dinner"],
        "note": "please be punctual",
        "status": "- Female, Foreigner / WP",
      },
    ];

    return Column(
      children: profiles.map((profile) {
        return Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row: name, age, nationality, warning icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${profile['name']} ${profile['age']}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ).paddingOnly(left: 30.w),
                  Icon(Icons.warning, color: Color(0xffBC0072), size: 30.sp),
                ],
              ),
              Row(
                children: [
                  Image.asset("assets/images/girl.png", scale: 3.5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profile['nationality'].toString(),
                        style: TextStyle(fontSize: 14.sp),
                      ),

                      Text(
                        profile['occupation'].toString(),
                        style: TextStyle(fontSize: 11.sp, color: Colors.pink),
                      ),

                      SizedBox(height: 4.h),
                      Text("Looking for: ${profile['lookingFor']}"),
                      Text(
                        "Available for: ${profile['availableFor'].toString()}",
                      ),
                      Text("Note: ${profile['note']}"),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 4.h),

              SizedBox(height: 4.h),
              Text(profile['status'].toString()),
              SizedBox(height: 8.h),

              // Accept / Reject buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Image.asset('assets/images/done.png', scale: 4),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Image.asset('assets/images/cross.png', scale: 4),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // Shared Card Content
  Widget contentCard({
    required IconData icon,
    required Color iconColor,
    required String title,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.purple.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Icon & Title
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon, color: iconColor, size: 50.w),
                SizedBox(height: 8.h),
                Text(
                  title,
                  style: TextStyle(
                    color: iconColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),

          // Restaurant info Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset(
                  'assets/images/food_1.png',
                  width: 100.w,
                  height: 100.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Macdonald',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Average price : \$10-15',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Text('4.8'),
                        SizedBox(width: 4.w),
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              index < 4 ? Icons.star : Icons.star_border,
                              color: Colors.orange,
                              size: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(Icons.access_time, size: 14.sp),
                        SizedBox(width: 4.w),
                        Text(
                          '10am - 9pm (5th May)',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 14.sp),
                        SizedBox(width: 4.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('North', style: TextStyle(fontSize: 12.sp)),
                            Text(
                              '#01-2 Bukit Batok Crescent (638498)',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Bookings for date
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.calendar_today, size: 16.sp),
              SizedBox(width: 4.w),
              Text(
                'Bookings For 5th May',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Best Western Food in the West?',
                style: TextStyle(fontSize: 16.sp),
              ),
            ],
          ),
          SizedBox(height: 8.h),

          // Looking For Section
          Obx(
            () => Row(
              children: [
                const Text(
                  'Looking For:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ).paddingOnly(right: 12.w),
                Row(
                  children: ['Male', 'Female']
                      .map(
                        (option) => GestureDetector(
                          onTap: () {
                            controller.selectLookingFor(option);
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 8.w),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  controller.selectedLookingFor.value == option
                                  ? const Color(0xff3F6EFF)
                                  : Colors.white,
                              border: Border.all(
                                color:
                                    controller.selectedLookingFor.value ==
                                        option
                                    ? const Color(0xff3F6EFF)
                                    : Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            child: Text(
                              option,
                              style: TextStyle(
                                color:
                                    controller.selectedLookingFor.value ==
                                        option
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),

          Obx(
            () => Wrap(
              spacing: 8.w,
              runSpacing: 4.h,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Text(
                  'Available For:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ...controller.availableFor.map((option) {
                  return GestureDetector(
                    onTap: () => controller.toggleAvailableFor(option),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: controller.selectedAvailableFor.contains(option)
                            ? const Color(0xff3F6EFF)
                            : Colors.white,
                        border: Border.all(
                          color:
                              controller.selectedAvailableFor.contains(option)
                              ? const Color(0xff3F6EFF)
                              : Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        option,
                        style: TextStyle(
                          color:
                              controller.selectedAvailableFor.contains(option)
                              ? Colors.white
                              : Colors.blue,
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),

          // Additional Notes and T&C
          SizedBox(height: 8.h),
          Row(
            children: [
              const Text(
                'Additional Notes:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 12.h),
              Text(
                'Please be punctual',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '- Reservations can\'t be amended',
                style: TextStyle(fontSize: 10.sp),
              ),
              Text(
                '- Booking will automatically expire within 24 hours',
                style: TextStyle(fontSize: 10.sp),
              ),
              Text(
                '- If no successful booking is made, you may apply with the next booking cycle',
                style: TextStyle(fontSize: 10.sp),
              ),
              Text(
                '- Only one booking allowed at a time',
                style: TextStyle(fontSize: 10.sp),
              ),
              Text(
                '- Only one successful match limit a week',
                style: TextStyle(fontSize: 10.sp),
              ),
              Text(
                '- Bookings for events will open at 9PM SGT the day before (e.g. Booking for 12th April will be opened at 9PM on 11th April)',
                style: TextStyle(fontSize: 10.sp),
              ),
              SizedBox(height: 4.h),
              Text(
                '- More T&C in our website',
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
