import 'package:flutter/material.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/save_result_button.dart';
import 'package:bmi_calculator/utils/bmi_brain.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/utils/csv_handler.dart';
import 'package:bmi_calculator/utils/size_config.dart';
import 'package:bmi_calculator/utils/user.dart';

class ResultPage extends StatefulWidget {
  final User user;
  final BMIBrain bmiBrain;

  ResultPage({
    super.key,
    required this.user,
  }) : bmiBrain = BMIBrain(user: user);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final CSVHandler csvHandler = CSVHandler();
  String? prevBMI;

  @override
  void initState() {
    super.initState();
    getPrevBMI();
  }

  Future<void> getPrevBMI() async {
    prevBMI = await csvHandler.getPreviousBMI(widget.user.name);
    setState(() {});
  }

  void saveResultAlert(BuildContext context, String newBMI) {
    Alert(
      context: context,
      type: AlertType.success,
      title: 'BMI Saved!',
      desc: '\nPrev. BMI: $prevBMI\nNew BMI: $newBMI',
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
          },
          height: getHeight(48.0),
          width: getWidth(120.0),
          color: Colors.teal,
          child: Text(
            'Okay',
            style: TextStyle(
              color: Colors.white,
              fontSize: getHeight(24.0),
            ),
          ),
        ),
      ],
      style: AlertStyle(
        backgroundColor: kMainBackgroundColor,
        titleStyle: TextStyle(
          color: kMainTextColor,
          fontSize: getHeight(24.0),
          fontWeight: FontWeight.bold,
        ),
        descStyle: TextStyle(
          color: kSecondaryTextColor,
          fontSize: getHeight(18.0),
        ),
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
            color: Colors.teal,
            width: getWidth(2.0),
            style: BorderStyle.solid,
          ),
        ),
        titleTextAlign: TextAlign.center,
        descTextAlign: TextAlign.center,
        buttonAreaPadding: EdgeInsets.symmetric(
          horizontal: getWidth(24.0),
          vertical: getHeight(24.0),
        ),
      ),
    ).show();
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
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: getWidth(24.0),
                vertical: getHeight(16.0),
              ),
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getWidth(24.0),
                  vertical: getHeight(24.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.bmiBrain.getResult().toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      widget.bmiBrain.getBMI(),
                      style: kBMITextStyle,
                    ),
                    Column(
                      children: [
                        Text(
                          widget.bmiBrain.getDescriptionTitle(),
                          style: kSmallBodyTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          widget.bmiBrain.getDescription(),
                          style: kBodyTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getHeight(8.0),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getWidth(40.0),
                      ),
                      child: Text(
                        widget.bmiBrain.getInterpretation(),
                        textAlign: TextAlign.center,
                        style: kBodyTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: getHeight(16.0),
                    ),
                    SaveResultButton(
                      onTap: () {
                        saveResultAlert(
                          context,
                          widget.bmiBrain.getBMI(),
                        );
                        csvHandler.addUserBMI(
                          MapEntry(
                            widget.user,
                            widget.bmiBrain.getBMI(),
                          ),
                        );
                      },
                      buttonTitle: 'Save Result',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonTitle: 'Re-Calculate BMI',
            ),
          ),
        ],
      ),
    );
  }
}
