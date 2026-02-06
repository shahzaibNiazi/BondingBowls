import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String selectedGender = 'Female';
  RangeValues ageRange = const RangeValues(25, 29);
  List<String> selectedIntentions = ['Serious'];

  @override
  Widget build(BuildContext context) {
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
                      Text(
                        '${ageRange.start.round()}-${ageRange.end.round()}',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Age Range Slider
                  Row(
                    children: [
                      Text(
                        '${ageRange.start.round()}',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(
                        child: SliderTheme(
                          data: SliderThemeData(
                            activeTrackColor: Colors.grey[400],
                            inactiveTrackColor: Colors.grey[300],
                            thumbColor: Colors.grey[800],
                            overlayColor: Colors.grey[800]!.withOpacity(0.2),
                            thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 12,
                            ),
                            overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 20,
                            ),
                          ),
                          child: RangeSlider(
                            values: ageRange,
                            min: 18,
                            max: 80,
                            onChanged: (RangeValues values) {
                              setState(() {
                                ageRange = values;
                              });
                            },
                          ),
                        ),
                      ),
                      Text(
                        '${ageRange.end.round()}',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
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
