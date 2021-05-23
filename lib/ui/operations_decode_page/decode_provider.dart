import 'package:flutter/widgets.dart';
import 'package:ta_calc/models/calculator.dart';
import 'package:ta_calc/models/operations/abstract/reg_operation.dart';
import 'package:ta_calc/resources/exceptions.dart';

class DecodeProvider with ChangeNotifier {
  Calculator _calc = Calculator();
  List<String> sources = [];
  List<String> results = [];

  void decode(String number) {
    try {
      var bigInt = BigInt.tryParse(number) ?? BigInt.one;
      var newCode = _calc.decode(bigInt);
      var operation = RegOpeartion.fromList(newCode);
      sources.add(number);
      results.add("$newCode\n$operation");
    } on InvalidCode {
      print("Invalid code");
    }
    notifyListeners();
  }

  void reset() {
    sources.clear();
    results.clear();
    notifyListeners();
  }
}
