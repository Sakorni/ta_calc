import 'package:flutter/material.dart';
import 'package:ta_calc/resources/enums.dart';

typedef void OnDoneAction(String input);
typedef void OnCancelAction();

class CalcPageProvider with ChangeNotifier {
  OnDoneAction onDone;
  OnCancelAction onCancel;
  CalcMode calcMode;
  String value = "";

  CalcPageProvider(
      {required this.onDone, required this.calcMode, required this.onCancel});

  ///Should be called when user tap on some number button
  void numberPressed(String number) {
    if (value.endsWith(', 0')) {
      value = value.substring(0, value.length - 1);
    }
    value += number;
    notifyListeners();
  }

  ///Deletes last digit
  void deletePressed() {
    if (value.isNotEmpty) {
      int deleteTo = value.length - 1;
      if (value.length > 2) {
        if (value.substring(deleteTo - 2, deleteTo) == ', ') {
          deleteTo -= 2;
        }
      }
      value = value.substring(0, deleteTo);
    }
    notifyListeners();
  }

  ///Clear input field and calls onCancel function
  void deleteAllPressed() {
    value = '';
    onCancel();
    notifyListeners();
  }

  ///Adds new value for "list<int>".
  ///Should be used only for CalcMode.encode
  void addPressed() {
    if (calcMode == CalcMode.decode) {
      return;
    }

    if (value.isEmpty) {
      value += '0';
    } else {
      value += ', 0';
    }
    notifyListeners();
  }

  ///Calls onDone function
  void calculate() {
    onDone(value);
    //TODO clear?
  }
}
