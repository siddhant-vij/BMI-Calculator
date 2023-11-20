import 'package:flutter/material.dart';

import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/utils/size_config.dart';

class BottomButton extends StatelessWidget {
  final void Function()? onTap;
  final String buttonTitle;

  const BottomButton({
    super.key,
    required this.onTap,
    required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kActiveButtonColor,
        margin: EdgeInsets.only(
          top: getHeight(16.0),
        ),
        width: double.infinity,
        height: getHeight(kButtonHeight),
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
