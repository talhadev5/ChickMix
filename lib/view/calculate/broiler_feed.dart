import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/config_io.dart';
import '../../controller/controller_io.dart';
import '../../widgets/widget_io.dart';

class BroilerFeed extends StatefulWidget {
  const BroilerFeed({super.key});

  @override
  State<BroilerFeed> createState() => _BroilerFeedState();
}

class _BroilerFeedState extends State<BroilerFeed> {
  final controller = Get.put(BroilerFeedController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: myAppBar(context, "Broiler"),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                gapBox(5),
                vertiaclCard(MyImages.broiler, 'Broiler Feed'),
                gapBox(20),
                CustomTextField(
                  labelText: "Birds",
                  hintText: "number of birds e.g. 10000",
                  keyboardType: TextInputType.number,
                  controller: controller.brirdsController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter number of birds";
                    }
                    return null;
                  },
                ),
                gapBox(10),
                CustomTextField(
                  labelText: "Birds Age",
                  hintText: "age of birds in days  e.g. 10",
                  controller: controller.brirdsAgeController,
                  keyboardType: TextInputType.number,

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter age of birds";
                    }
                    return null;
                  },
                ),
                gapBox(30),
                CustomButton(
                  label: "Calculate",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.calculateFeed();
                    } else {
                      // print("Form validation failed.");
                    }
                  },
                ),
              gapBox(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
