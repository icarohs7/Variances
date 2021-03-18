import 'package:flutter/cupertino.dart';
import 'package:variances/libs.dart';

class AppController {
  AppController() {
    inputController.addListener(() {
      final value = inputController.text.replaceAll(',', '.').toDoubleOrNull();
      if (value == null) return;
      runInAction(() => inputValue.value = value);
    });
    satoshiInputController.addListener(() {
      final value = satoshiInputController.text.replaceAll(',', '.').toDoubleOrNull();
      if (value == null) return;
      runInAction(() => inputValue.value = value * 10E-9);
    });
  }

  late final inputController = TextEditingController();
  late final satoshiInputController = TextEditingController();
  late final inputValue = Observable<double>(0);
}
