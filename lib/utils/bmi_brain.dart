import 'package:bmi_calculator/utils/user.dart';

class BMIBrain {
  final User user;

  const BMIBrain({required this.user});

  double _calculateBMI() {
    return user.weight / ((user.height / 100) * (user.height / 100));
  }

  String getBMI() {
    return _calculateBMI().toStringAsFixed(1);
  }

  String getResult() {
    double bmi = _calculateBMI();
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    double bmi = _calculateBMI();
    if (bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

  String getDescriptionTitle() {
    double bmi = _calculateBMI();
    if (bmi >= 25) {
      return 'Overweight BMI Range';
    } else if (bmi > 18.5) {
      return 'Normal BMI Range';
    } else {
      return 'Underweight BMI Range';
    }
  }

  String getDescription() {
    double bmi = _calculateBMI();
    if (bmi >= 25) {
      return '>= 25 kg/m2';
    } else if (bmi > 18.5) {
      return '18.5 to 25 kg/m2';
    } else {
      return '<= 18.5 kg/m2';
    }
  }
}
