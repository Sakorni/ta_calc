import 'package:flutter/widgets.dart';
import 'package:ta_calc/models/calculator.dart';
import 'package:ta_calc/models/operations/abstract/reg_operation.dart';
import 'package:ta_calc/resources/exceptions.dart';

class DecodeProvider with ChangeNotifier {
  Calculator _calc = Calculator();
  List<List<int>> codes = [];
  List<RegOpeartion> operations = [];

  void decode(String number) {
    try {
      var bigInt = BigInt.tryParse(number) ?? BigInt.one;
      var newCode = _calc.decode(bigInt);
      codes.add(newCode);
      operations.add(
        RegOpeartion.fromList(newCode),
      );
    } on InvalidCode {
      print("Invalid code");
    }
    notifyListeners();
  }

  void reset() {
    codes.clear();
    operations.clear();
    notifyListeners();
  }
}
