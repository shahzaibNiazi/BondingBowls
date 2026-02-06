import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscountRibbon extends StatelessWidget {
  final String text;

  const DiscountRibbon({super.key, this.text = '-10%'});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/images/ribon.png',
          width: 90, // 👈 important: wider than tall
          height: 32,
          fit: BoxFit.contain,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 6), // aligns text on stripe
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
