import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poultry_calculator/config/routes/routes_name.dart';
import 'package:poultry_calculator/config/utils/app_colors.dart';

import '../config/utils/images.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    // Navigate to Onboarding after 2 seconds
    Timer(const Duration(seconds: 2), () {
      Get.offAllNamed(MyRouteName.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(MyImages.logoCr),
            ),
            Spacer(),
            Center(
              child: Text(
                "Provided By Poul3y",
                style: TextStyle(color: MyColors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
