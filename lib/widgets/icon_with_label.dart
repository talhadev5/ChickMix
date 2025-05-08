import 'package:flutter/material.dart';
import 'package:poultry_calculator/config/config_io.dart';

class IconWithLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;
  final Color bgColor;
  final VoidCallback onPressed;

  const IconWithLabel({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.iconColor = Colors.white,
    this.bgColor = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: bgColor,
          child: IconButton(
            icon: Icon(icon, color: iconColor),
            onPressed: onPressed,
          ),
        ),
        SizedBox(height: 4),
        infoText(label, labelcolor: MyColors.white),
      ],
    );
  }
}
