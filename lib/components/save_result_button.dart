import 'package:flutter/material.dart';

import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/utils/size_config.dart';

class SaveResultButton extends StatelessWidget {
  final void Function()? onTap;
  final String buttonTitle;

  const SaveResultButton({
    super.key,
    required this.onTap,
    required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kInactiveButtonColor,
        height: getHeight(kButtonHeight),
        width: getWidth(kButtonWidth),
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
