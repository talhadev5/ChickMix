import 'package:flutter/material.dart';

Widget flipImg(String getImg, {String? flip}) {
  // Determine the flip direction
  double scaleX = 1.0;
  double scaleY = 1.0;

  if (flip == 'v') {
    scaleY = -1.0; // Vertical flip
  } else if (flip == 'h') {
    scaleX = -1.0; // Horizontal flip
  }

  return ClipRect(
    child: Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..scale(scaleX, scaleY),
      child: Image.asset(getImg, width: double.infinity, fit: BoxFit.fitHeight),
    ),
  );
}
