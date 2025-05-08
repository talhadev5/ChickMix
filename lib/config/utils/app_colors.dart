import 'package:flutter/material.dart';

class MyColors {
  // // Core Colors
  static const Color primary = Color(0xffFD9F50);

  // // Neutral Colors
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff262626);
  static const Color grey = Color(0xffB6B4B4);
  static const Color greylight = Color(0xFFECECEC);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFFFCB376), // top
      Color(0xFFFE8A29), // bottom
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
