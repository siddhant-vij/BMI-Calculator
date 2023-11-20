import 'package:flutter/material.dart';

import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/utils/size_config.dart';

class PropertyValue extends StatelessWidget {
  final String property;
  final String value;
  final String unit;

  const PropertyValue({
    super.key,
    required this.property,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          property,
          style: kActiveLabelTextStyle,
        ),
        SizedBox(
          height: getHeight(8.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              value.toString(),
              style: kNumberTextStyle,
            ),
            Text(
              unit,
              style: kActiveLabelTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}
