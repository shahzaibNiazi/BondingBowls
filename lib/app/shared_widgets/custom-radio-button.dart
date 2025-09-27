import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class CustomRadioButton extends StatelessWidget {
  final bool isSelected;
  final Widget? icon;
  final Color selectedColor;
  final Color unselectedColor;
  final double size;
  final double borderThickness;
  final double innerCirclePadding;

  const CustomRadioButton({
    super.key,
    required this.isSelected,
    this.selectedColor = Colors.blue,
    this.unselectedColor = Colors.grey,
    this.size = 20.0,
    this.borderThickness = 1.0,
    this.innerCirclePadding = 6.0,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? null : AppColors.white,
        border: Border.all(
          color: isSelected ? selectedColor : unselectedColor,
          width: borderThickness,
        ),
      ),
      child: Center(
        child:
            icon ??
            Container(
              height: size - 1.5 * (borderThickness + innerCirclePadding),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? selectedColor : Colors.transparent,
              ),
            ),
      ),
    );
  }
}
