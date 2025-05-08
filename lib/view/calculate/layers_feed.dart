import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/config_io.dart';
import '../../controller/controller_io.dart';
import '../../widgets/widget_io.dart';

// ignore: must_be_immutable
class LayersFeed extends StatelessWidget {
  LayersFeed({super.key});
  final controller = Get.put(LayersFeedController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SafeArea(
        child: Scaffold(
          appBar: myAppBar(context, "Layer"),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(15),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  gapBox(5),
                  vertiaclCard(MyImages.layer, 'Layer Feed'),
                  gapBox(20),
                  CustomTextField(
                    labelText: "No of Birds",
                    hintText: "number of birds e.g. 1000",
                    keyboardType: TextInputType.number,
                    controller: controller.layerBirds,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter number of birds";
                      }
                      return null;
                    },
                  ),
                  gapBox(10),
                  CustomTextField(
                    labelText: "Age in Weeks",
                    hintText: "age of birds in weeks e.g. 10",
                    controller: controller.layerAge,
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
                        controller.calculateLayersFeed();
                      } else {
                        // ignore: avoid_print
                        print("Form validation failed.");
                      }
                    },
                  ),
                  gapBox(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
