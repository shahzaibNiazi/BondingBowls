import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscountRibbon extends StatelessWidget {
  final String text;

  const DiscountRibbon({super.key, this.text = '-10%'});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 5,
          left: 0,
          child: Transform.rotate(
            angle: -0.785398, // -45 degrees in radians
            child: Container(
              color: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
