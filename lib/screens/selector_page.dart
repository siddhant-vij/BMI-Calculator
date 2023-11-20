import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/components/property_value.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/utils/size_config.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/utils/user.dart';

class SelectorPage extends StatefulWidget {
  const SelectorPage({super.key});

  @override
  State<SelectorPage> createState() => _SelectorPageState();
}

class _SelectorPageState extends State<SelectorPage> {
  String? name;
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  bool makeButtonActive = false;

  final nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kMainBackgroundColor,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            color: kMainTextColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(16.0)),
                child: TextField(
                  controller: nameController,
                  onChanged: (_) => name = nameController.text,
                  decoration: const InputDecoration(
                    hintText: 'Enter your name here...',
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'Male',
                      isActive: selectedGender == Gender.male,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'Female',
                      isActive: selectedGender == Gender.female,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PropertyValue(
                    property: 'Height',
                    value: height.toString(),
                    unit: ' cm',
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: getWidth(16.0)),
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: getHeight(2.0),
                        activeTrackColor: kMainTextColor,
                        inactiveTrackColor: kSecondaryTextColor,
                        thumbColor: kActiveButtonColor,
                        overlayColor: kSecondaryButtonColor,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: getRadius(8.0),
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: getRadius(24.0),
                        ),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PropertyValue(
                          property: 'Weight',
                          value: weight.toString(),
                          unit: ' kg',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PropertyValue(
                          property: 'Age',
                          value: age.toString(),
                          unit: ' yrs',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: BottomButton(
              buttonTitle: 'Calculate BMI',
              onTap: () {
                if (name == null || name!.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Please enter your name',
                      ),
                    ),
                  );
                } else if (selectedGender == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Please select your gender',
                      ),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        user: User(
                          name: name!,
                          age: age,
                          gender: selectedGender!,
                          height: height.toDouble(),
                          weight: weight.toDouble(),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
