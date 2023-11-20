import 'package:flutter/material.dart';

import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/utils/size_config.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;

  const IconContent({
    super.key,
    required this.icon,
    required this.label,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: getHeight(64.0),
          color: isActive ? kMainTextColor : kSecondaryTextColor,
        ),
        SizedBox(
          height: getHeight(16.0),
        ),
        Text(
          label,
          style: isActive ? kActiveLabelTextStyle : kInactiveLabelTextStyle,
        ),
      ],
    );
  }
}
