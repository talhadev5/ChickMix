import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:poultry_calculator/config/utils/app_colors.dart';
import 'package:poultry_calculator/widgets/dynamic_table.dart';
import 'package:poultry_calculator/widgets/custom_dialog.dart';
import 'package:poultry_calculator/widgets/loading_circle.dart';

class LayersFeedController extends GetxController {
  final layerBirds = TextEditingController();
  final layerAge = TextEditingController();
  final numberFormatter = NumberFormat.decimalPattern();

  Future<void> calculateLayersFeed() async {
    try {
      final birds = int.parse(layerBirds.text);
      final ageWeeks = int.parse(layerAge.text);

      String feedType;
      double feedPerBird; // grams per bird per day
      int feedTimes;

      if (ageWeeks <= 6) {
        feedType = "Starter";
        feedPerBird = 30 + (ageWeeks * 5); // ~30g to ~60g
        feedTimes = 4;
      } else if (ageWeeks <= 18) {
        feedType = "Grower";
        feedPerBird = 65 + ((ageWeeks - 7) * 3); // ~65g to ~104g
        feedTimes = 3;
      } else {
        feedType = "Layer";
        feedPerBird = 110; // Standard for productive layers
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
            "Type": "Layer",
            "Birds": numberFormatter.format(birds),
            "Age (Weeks)": ageWeeks.toString(),
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
