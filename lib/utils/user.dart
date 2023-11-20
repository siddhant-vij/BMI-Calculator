import 'package:bmi_calculator/utils/constants.dart';

class User {
  final String name;
  final int age;
  final Gender gender;
  final double height;
  final double weight;

  const User({
    required this.name,
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
  });
}
