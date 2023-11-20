import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/utils/user.dart';

class CSVHandler {
  final Map<User, String> _userBMIMap = {};

  CSVHandler();

  Future<File> get _file async {
    return await _getFile();
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/$kBmiDataFile';
    return File(path);
  }

  Future<void> _ensureFileExists() async {
    final file = await _getFile();
    if (!await file.exists()) {
      await file.create(recursive: true);
      await file.writeAsString('Name,Age,Gender,Height,Weight,BMI\n');
    }
  }

  Future<Map<User, String>> _readBMI() async {
    final file = await _file;
    final contents = await file.readAsLines();
    final Map<User, String> newUserBMIMap = {};
    for (final line in contents.skip(1)) {
      final data = line.split(',');
      final user = User(
        name: data[0],
        age: int.parse(data[1]),
        gender: data[2] == 'male' ? Gender.male : Gender.female,
        height: double.parse(data[3]),
        weight: double.parse(data[4]),
      );
      newUserBMIMap[user] = data[5];
    }
    _userBMIMap.addAll(newUserBMIMap);
    return _userBMIMap;
  }

  double _returnBMIUserExists(String userName) {
    for (final user in _userBMIMap.keys) {
      if (user.name == userName) {
        return double.parse(_userBMIMap[user]!);
      }
    }
    return 0.0;
  }

  Future<String> getPreviousBMI(String userName) async {
    await _ensureFileExists();
    await _readBMI();
    double previousBMI = _returnBMIUserExists(userName);
    if (previousBMI != 0.0) {
      return previousBMI.toString();
    } else {
      return 'First Entry';
    }
  }

  Future<void> _writeBMI() async {
    final file = await _file;
    final buffer = StringBuffer();
    buffer.writeln('Name,Age,Gender,Height,Weight,BMI');
    _userBMIMap.forEach((user, bmi) {
      buffer.writeln(
          '${user.name},${user.age},${user.gender.name},${user.height},${user.weight},$bmi');
    });
    await file.writeAsString(buffer.toString());
  }

  Future<void> addUserBMI(MapEntry<User, String> userBMI) async {
    _userBMIMap.clear();
    await _ensureFileExists();
    await _readBMI();
    _userBMIMap.removeWhere((user, _) => user.name == userBMI.key.name);
    _userBMIMap[userBMI.key] = userBMI.value;
    await _writeBMI();
  }
}
