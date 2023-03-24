import 'package:flutter/cupertino.dart';

class LoginViewModel extends ChangeNotifier {
  bool isCheckBoxOkay = false;
  String? _inputText;

  void checkBoxChange(bool value) {
    isCheckBoxOkay = value;
    notifyListeners();
  }
}
