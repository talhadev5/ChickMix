import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poultry_calculator/config/routes/routes_name.dart';
import 'package:poultry_calculator/widgets/custome_button.dart';
import 'package:poultry_calculator/config/utils/formatting.dart';

import '../config/utils/app_colors.dart';
import '../config/utils/images.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),
            SizedBox(
              width: 280,
              // height: 100,
              child: Image.asset(MyImages.onboarding1),
            ),
            Spacer(),
            heading18('Welcome to \nPoultry Calculator', alignC: true),
            gapBox(10),
            infoText(
              'Easily calculate estimation that simplify your farm management with our powerful tools.',
              alignC: true,
            ),
            gapBox(20),
            CustomButton(
              label: 'Get Started',
              onPressed: () => Get.offAllNamed(MyRouteName.home),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
