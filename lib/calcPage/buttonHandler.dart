import 'package:flutter/material.dart';

class MainHandler {
  static MainHandler _instance = MainHandler._();
  TextEditingController controller = TextEditingController();

  List<int> values = [];

  MainHandler._();
  factory MainHandler() {
    return _instance;
  }

  String valuesAsString() {
    var res = '';
    int lastInd = values.length - 1;
    if (values.isEmpty) {
      return '';
    }
    for (var i = 0; i < lastInd; i++) {
      res += values[i].toString() + ', ';
    }
    res += values[lastInd].toString();
    return res;
  }

  void numberPressed(int number) {
    int lastInd = values.length - 1;
    if (lastInd == -1) {
      values.add(number);
    } else {
      int changeableValue = values[lastInd];
      changeableValue = changeableValue * 10 + number;
      values[lastInd] = changeableValue;
    }
    _changeText();
  }

  void deletePressed() {
    if (values.isNotEmpty) {
      if (values.last == 0) {
        values.removeLast();
      } else {
        int changeableValue = values.last;
        changeableValue = changeableValue ~/ 10;
        values.last = changeableValue;
      }
    }
    _changeText();
  }

  void addPressed() {
    values.add(0);
    _changeText();
  }

  void calculate() {
    //TODO calculate че-то там
    var result = 0;
    values.clear();
    values.add(result);
    _changeText();
  }

  void _changeText() {
    controller.text = valuesAsString();
  }
}
