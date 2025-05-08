import 'package:flutter/material.dart';
import 'package:poultry_calculator/config/utils/app_colors.dart';
import 'package:poultry_calculator/config/utils/formatting.dart';

class ExitConfirmationDialog {
  static Future<bool> show(BuildContext context) async {
    return await showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: heading14('Exit App'),
                content: infoText('Do you really want to exit the app?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text('No'),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        MyColors.greylight,
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text('Yes'),
                  ),
                ],
              ),
        ) ??
        false;
  }
}
