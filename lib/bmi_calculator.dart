import 'package:flutter/material.dart';

import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/utils/size_config.dart';
import 'package:bmi_calculator/screens/selector_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        primaryColor: kMainBackgroundColor,
        scaffoldBackgroundColor: kMainBackgroundColor,
      ),
      home: const SelectorPage(),
    );
  }
}
