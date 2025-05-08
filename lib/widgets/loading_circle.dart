import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> showLoadingDialog(BuildContext context, {
  double size = 50.0,
  Color color = Colors.white,
  Duration duration = const Duration(seconds: 2),
}) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return Center(
        child:
        SizedBox(
    height: size,
    width: size,
    child: CircularProgressIndicator(
      color: color,
      strokeWidth: size/10,
    ),
  )
      );
    },
  );

  await Future.delayed(duration);

  Navigator.of(Get.context!).pop(); // Dismiss the loader
}
