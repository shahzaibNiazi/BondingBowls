import 'package:flutter/material.dart';

class AppColors {
  static const Color white = Colors.white;
  static const Color lightWhite = Color(0xffD0CFCF);
  static const Color black = Colors.black;
  static const Color lightBlack = Color(0xff303030);
  static const Color grey6B = Color(0xFF65676B);
  static const Color lightGolden = Color(0xFFFFC76F);
  static const Color darkGolden = Color(0xFFDFA549);
  static const Color circleColor = Color(0xFF9CA3AF);
  static const Color pinkColor = Color(0xffC672A5);

  static const Color trans = Colors.transparent;
  static const Color primary = Color(0xffEB953A);
  static const Color primary5FF = Color(0xFFEBF5FF);
  static const Color secondary = Color(0xFF65676B);
  static const Color blue = Color(0xFF004BFE);
  static const Color tertiary = Color(0xFF27C4F4);
  static const Color inputfield = Color(0xFFF5F5FA);
  static const Color inputBorder = Color(0xFF414141);
  static const Color backgroundShadow = Color(0xFFF7F7FB);
  static const Color hint = Color(0xFF6C6C6C);
  static const Color hint2 = Color(0xFFC6C6C6);
  static const Color green = Color(0xFF059669);
  static const Color yellow = Color(0xFFE2BF06);
  static const Color greyLight = Color(0xFFF4F9FF);
  static const Color lightGrey = Color(0xFFB1B5C3);
  static const Color dropShadow = Color(0xff000000);
  static const Color greyText = Color(0xFF9CA3AF);
  static const Color boxColor = Color(0xFFF1EEED);
  static const Color lightPink = Color(0xFFFBABAB);
  static const Color bottomLineColor = Color(0xFFB9B9B9);
  static const Color lightPrimary = Color(0xFFD4EAFF);
  static const Color border = Color(0xFFD3D6DA);
  static const Color weekGrey = Color(0xFFADAEB5);
  static const Color archiveColor = Color(0xFFA9D5FF);
  static const Color subTitleColor = Color(0xFFB0B0B0);
  static const Color darkBackgroundColor = Color(0xFF1F1F1F);
  static const Color grey = Color(0xFF414141);
  static const Color lightBackgroundColor = Color(0xFF303030);
  static const Color lightBlue = Color(0xFFD0BCFF);
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xffFFC76F), // Start color
      Color(0xffDFA549), // End color
    ],
    begin: Alignment.topCenter, // Gradient direction
    end: Alignment.bottomCenter,
  );
  static LinearGradient welcomeGradient = LinearGradient(
    colors: [
      Color(0xffDFA549).withOpacity(0.5),
      Color(0xffDFA549).withOpacity(0.0),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondary, primary],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient greyGradient = LinearGradient(
    colors: [grey6B, grey6B],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient dealGradient = LinearGradient(
    colors: [Color(0xFF005EBD), Color(0xFFFF5252)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static const LinearGradient backgroundColorGradient = LinearGradient(
    colors: [Color(0xFF1F1F1F), Color(0xFF303030)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
