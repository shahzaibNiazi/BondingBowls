import 'package:convo_hearts/Presentation/make_a_booking/controllers/make_a_booking_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String selectedGender = 'Female';
  RangeValues ageRange = const RangeValues(25, 29);
  List<String> selectedIntentions = ['Serious'];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MakeABookingController>(
      builder: (controller) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.65,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close, size: 28),
                    ),
                    Column(
                      children: [
                        Text(
                          'Filter',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '(Can select multiple options for all)',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 48), // Balance the layout
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Gender Section
                      Row(
                        children: [
                          Text(
                            'Gender',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.transgender,
                            size: 20.sp,
                            color: Colors.grey[700],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Gender Buttons
                      _buildGenderButton('Male'),
                      const SizedBox(height: 10),
                      _buildGenderButton('Female'),

                      const SizedBox(height: 30),

                      // Age Range Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Age Range',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text('👦👴', style: TextStyle(fontSize: 18.sp)),
                            ],
                          ),
                          sectionLabel(
                            "(${controller.ageRange.start.round()}-${controller.ageRange.end.round()})",
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Age Range Slider
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 80.h,
                              padding: EdgeInsets.symmetric(horizontal: 24.w),
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  double trackWidth = constraints.maxWidth;
                                  double startPos =
                                      ((controller.ageRange.start - 18) / 49) *
                                      trackWidth;
                                  double endPos =
                                      ((controller.ageRange.end - 18) / 49) *
                                      trackWidth;

                                  return GestureDetector(
                                    onPanUpdate: (details) {
                                      controller.ageUpdate(
                                        details,
                                        context,
                                        trackWidth,
                                        startPos,
                                        endPos,
                                      );
                                    },
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        // Age labels above the slider
                                        Positioned(
                                          top: 0,
                                          left: (startPos - 15).clamp(
                                            0,
                                            trackWidth - 30,
                                          ),
                                          child: Text(
                                            '${controller.ageRange.start.round()}',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          left: (endPos - 15).clamp(
                                            0,
                                            trackWidth - 30,
                                          ),
                                          child: Text(
                                            '${controller.ageRange.end.round()}',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),

                                        // Track background
                                        Positioned(
                                          top: 35,
                                          left: 0,
                                          right: 0,
                                          child: Container(
                                            height: 8,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade300,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                        ),

                                        // Active track (between thumbs)
                                        Positioned(
                                          top: 35,
                                          left: startPos,
                                          child: Container(
                                            width: endPos - startPos,
                                            height: 8,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade700,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                        ),

                                        // Start thumb (left circle)
                                        Positioned(
                                          left: startPos - 20,
                                          top: 20,
                                          child: GestureDetector(
                                            onPanUpdate: (details) {
                                              double delta = details.delta.dx;
                                              double newStart =
                                                  (controller.ageRange.start +
                                                          (delta *
                                                              49 /
                                                              trackWidth))
                                                      .clamp(
                                                        18.0,
                                                        controller
                                                                .ageRange
                                                                .end -
                                                            1,
                                                      );
                                              controller.ageRange = RangeValues(
                                                newStart,
                                                controller.ageRange.end,
                                              );
                                              controller.update();
                                            },
                                            child: SizedBox(
                                              width: 40,
                                              height: 40,
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Positioned(
                                                    child: Image.asset(
                                                      "assets/images/bol.png",
                                                      height: 40,
                                                      width: 40,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),

                                        // End thumb (right circle)
                                        Positioned(
                                          left: endPos - 20,
                                          top: 20,
                                          child: GestureDetector(
                                            onPanUpdate: (details) {
                                              double delta = details.delta.dx;
                                              double newEnd =
                                                  (controller.ageRange.end +
                                                          (delta *
                                                              49 /
                                                              trackWidth))
                                                      .clamp(
                                                        controller
                                                                .ageRange
                                                                .start +
                                                            1,
                                                        67.0,
                                                      );
                                              controller.ageRange = RangeValues(
                                                controller.ageRange.start,
                                                newEnd,
                                              );
                                              controller.update();
                                            },
                                            child: SizedBox(
                                              width: 40,
                                              height: 40,
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Positioned(
                                                    child: Image.asset(
                                                      "assets/images/bol.png",
                                                      height: 40,
                                                      width: 40,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      // Dating Intentions Section
                      Row(
                        children: [
                          Text(
                            'Dating intentions',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text('👀', style: TextStyle(fontSize: 18.sp)),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Intention Buttons
                      _buildIntentionButton('Casual'),
                      const SizedBox(height: 10),
                      _buildIntentionButton('Serious'),
                      const SizedBox(height: 10),
                      _buildIntentionButton('Friends'),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),

              // Save Button
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: OutlinedButton(
                    onPressed: () {
                      // Handle save action
                      Navigator.pop(context, {
                        'gender': selectedGender,
                        'ageRange': {
                          'min': ageRange.start.round(),
                          'max': ageRange.end.round(),
                        },
                        'intentions': selectedIntentions,
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.blue, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGenderButton(String gender) {
    final isSelected = selectedGender == gender;
    return InkWell(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey[800] : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.grey[800]! : Colors.grey[400]!,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          gender,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildIntentionButton(String intention) {
    final isSelected = selectedIntentions.contains(intention);
    return InkWell(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedIntentions.remove(intention);
          } else {
            selectedIntentions.add(intention);
          }
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey[800] : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.grey[800]! : Colors.grey[400]!,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          intention,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

class FigmaThumbShape extends SliderComponentShape {
  final double radius;

  const FigmaThumbShape({this.radius = 14});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(radius * 2, radius * 2);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;

    final paint = Paint()
      ..color = sliderTheme.thumbColor!
      ..style = PaintingStyle.fill;

    // Main circle
    canvas.drawCircle(center, radius, paint);

    // Bottom small rounded rect notch
    final notchRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(center.dx, center.dy + radius * 0.9),
        width: radius * 1.1,
        height: radius * 0.9,
      ),
      const Radius.circular(4),
    );

    canvas.drawRRect(notchRect, paint);
  }
}

Widget sectionLabel(String text) => Padding(
  padding: EdgeInsets.only(top: 20.h, bottom: 12.h),
  child: Text(
    text,
    style: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: Color(0xff000000),
    ),
  ),
);
