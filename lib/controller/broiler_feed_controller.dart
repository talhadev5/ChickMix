import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:poultry_calculator/config/utils/app_colors.dart';
import 'package:poultry_calculator/widgets/dynamic_table.dart';
import 'package:poultry_calculator/widgets/custom_dialog.dart';
import 'package:poultry_calculator/widgets/loading_circle.dart';

class BroilerFeedController extends GetxController {
  final brirdsController = TextEditingController();
  final brirdsAgeController = TextEditingController();
  final numberFormatter = NumberFormat.decimalPattern();

  Future<void> calculateFeed() async {
    try {
      final birds = int.parse(brirdsController.text);
      final age = int.parse(brirdsAgeController.text);

      String feedType;
      double feedPerBird; // grams per bird per day
      int feedTimes;

      if (age <= 10) {
        feedType = "Starter";
        feedPerBird = 13 + (age - 1) * 3.5; // 13g to ~45g
        feedTimes = 4;
      } else if (age <= 24) {
        feedType = "Grower";
        feedPerBird = 50 + ((age - 11) * 3.2); // ~50g to ~95g
        feedTimes = 3;
      } else if (age <= 35) {
        feedType = "Finisher";
        feedPerBird = 100 + ((age - 25) * 3); // ~100g to ~130g
        feedTimes = 2;
      } else {
        feedType = "Stable";
        feedPerBird = 120; // Stable quantity
        feedTimes = 2;
      }
      double totalFeedKg = (feedPerBird * birds) / 1000;
      double totalFeedBags = totalFeedKg / 50;

      await showLoadingDialog(
        Get.context!,
        size: 25,
        color: MyColors.primary,
        duration: Duration(seconds: 1),
      );

      customReceipt(
        Get.context!,
        DynamicTable(
          infoData: {
            "Type": "Broiler",
            "Birds": numberFormatter.format(birds),
            "Age (Days)": age.toString(),
            "Feed Type": feedType,
            "Feed / Bird": "${feedPerBird.toStringAsFixed(1)} g",
            "Total Feed": "${totalFeedKg.toStringAsFixed(1)} kg",
            "Feed in (Bags)": "${totalFeedBags.toStringAsFixed(1)} bags",
            "Feeding Times": "$feedTimes times/day",
          },
        ),
      );
    } catch (e) {
      Get.snackbar(
        "Invalid Input",
        "Please enter valid numbers for birds and age.",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
