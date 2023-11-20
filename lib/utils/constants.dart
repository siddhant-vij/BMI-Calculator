import 'package:flutter/material.dart';

import 'package:bmi_calculator/utils/size_config.dart';

const kBmiDataFile = 'bmi_data.csv';
enum Gender {
  male,
  female,
}

const kMainBackgroundColor = Color(0xFF0A0E21);

const kMainTextColor = Color(0xFFFFFFFF);
const kSecondaryTextColor = Color(0xFF8D8E98);

const kActiveCardColor = Color(0xFF1D1E33);
const kInactiveCardColor = Color(0xFF111328);

const kActiveButtonColor = Color(0xFFEB1555);
const kSecondaryButtonColor = Color(0x29EB1555);
const kInactiveButtonColor = Color(0xFF111328);
final kButtonHeight = getHeight(80.0);
final kButtonWidth = getWidth(240.0);

const kFillColor = Color(0xFF4C4F5E);

final kActiveLabelTextStyle = TextStyle(
  fontSize: getHeight(16.0),
  color: kMainTextColor,
);

final kInactiveLabelTextStyle = TextStyle(
  fontSize: getHeight(16.0),
  color: kSecondaryTextColor,
);

final kNumberTextStyle = TextStyle(
  fontSize: getHeight(32.0),
  fontWeight: FontWeight.w800,
);

final kLargeButtonTextStyle = TextStyle(
  fontSize: getHeight(24.0),
  fontWeight: FontWeight.bold,
);

final kTitleTextStyle = TextStyle(
  fontSize: getHeight(48.0),
  fontWeight: FontWeight.bold,
);

final kResultTextStyle = TextStyle(
  color: const Color(0xFF24D876),
  fontSize: getHeight(24.0),
  fontWeight: FontWeight.bold,
);

final kBMITextStyle = TextStyle(
  fontSize: getHeight(80.0),
  fontWeight: FontWeight.bold,
);

final kBodyTextStyle = TextStyle(
  fontSize: getHeight(20.0),
);

final kSmallBodyTextStyle = TextStyle(
  fontSize: getHeight(20.0),
  color: kSecondaryTextColor,
);
