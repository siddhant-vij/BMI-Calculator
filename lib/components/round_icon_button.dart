import 'package:flutter/material.dart';

import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/utils/size_config.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;

  const RoundIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: getWidth(32.0),
        height: getHeight(32.0),
      ),
      shape: const CircleBorder(),
      fillColor: kFillColor,
      child: Icon(
        icon,
        size: getHeight(16.0),        
      ),
    );
  }
}
