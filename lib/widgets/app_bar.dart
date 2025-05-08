import 'package:flutter/material.dart';

import '../config/config_io.dart';

AppBar myAppBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: MyColors.primary,
    automaticallyImplyLeading: false, // we’ll manage it manually
    leading:
        Navigator.canPop(context)
            ? IconButton(
              icon: Icon(Icons.arrow_back, color: MyColors.white),
              onPressed: () => Navigator.pop(context),
            )
            : null,
    title: heading18(title, color: MyColors.white),
    centerTitle: true,
  );
}
