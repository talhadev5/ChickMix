import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/config_io.dart';

Widget horizontalCard({
  required String label,
  required String img,
  required String pageRoute,
  required Color theme,
}) {
  return GestureDetector(
    onTap: () => Get.toNamed(pageRoute),
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(child: heading18(label, color: MyColors.white)),
          Hero(
            tag: 'hero-$img',
            child: Container(
              width: 60,
              height: 60,
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
        ],
      ),
    ),
  );
}