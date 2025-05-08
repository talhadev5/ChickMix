import 'package:flutter/material.dart';

import '../config/config_io.dart';

Widget appAd() {
  return Row(
    children: [
      SizedBox(width: 48, height: 48, child: Image.asset(MyImages.logoCr)),
      SizedBox(width: 12),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [heading14("Poultry Calculator"), Text("Free on PlayStore")],
      ),
    ],
  );
}
