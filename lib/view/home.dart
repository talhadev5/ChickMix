import 'package:flutter/material.dart';
import 'package:poultry_calculator/widgets/widget_io.dart';
import '../config/config_io.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // ignore: deprecated_member_use
      child: WillPopScope(
        onWillPop: () => ExitConfirmationDialog.show(context),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                gapBox(20),
                vertiaclCard(MyImages.logoCr, 'Poultry Calculator'),
                gapBox(10),
                horizontalCard(
                  label: 'Layer Feed',
                  img: MyImages.layer,
                  pageRoute: MyRouteName.layersFeed,
                  theme: MyColors.grey,
                ),
                gapBox(10),
                horizontalCard(
                  label: 'Broiler Feed',
                  img: MyImages.broiler,
                  pageRoute: MyRouteName.broilerFeed,
                  theme: MyColors.primary,
                ),
                gapBox(10),
                Image.asset(MyImages.comming1),
                gapBox(10),
                Image.asset(MyImages.comming2),
                gapBox(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
