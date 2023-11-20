import 'package:flutter/material.dart';

import 'package:bmi_calculator/utils/size_config.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget? cardChild;
  final void Function()? onPress;

  const ReusableCard({
    super.key,
    required this.color,
    this.cardChild,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: getHeight(16.0),
          horizontal: getWidth(16.0),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(getRadius(8.0)),
          color: color,
        ),
        child: cardChild,
      ),
    );
  }
}
