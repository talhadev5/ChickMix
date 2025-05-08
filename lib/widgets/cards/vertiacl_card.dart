import 'package:flutter/material.dart';
import '../../config/config_io.dart';

Widget vertiaclCard(String img, String label) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
    decoration: BoxDecoration(
      // color: ,
      gradient: MyColors.primaryGradient,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        Hero(
          tag: 'hero-$img',
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: MyColors.white,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(img),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        gapBox(10),
        heading18(label, color: MyColors.white),
      ],
    ),
  );
}
