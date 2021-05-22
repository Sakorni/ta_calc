import 'package:flutter/material.dart';
import 'package:ta_calc/resources/enums.dart';

class CalcPageProvider with ChangeNotifier {
  void Function(String) onDone;
  CalcMode calcMode;
  String value = "";

  CalcPageProvider({required this.onDone, required this.calcMode});

  void numberPressed(String number) {
    if (value.endsWith(', 0')) {
      value = value.substring(0, value.length - 1);
    }
    value += number;
    notifyListeners();
  }

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

  void deleteAllPressed() {
    value = '';
    notifyListeners();
  }

  void addPressed() {
    value += ', 0';
    notifyListeners();
  }

  void calculate() {
    onDone(value);
    //TODO clear?
  }
}
