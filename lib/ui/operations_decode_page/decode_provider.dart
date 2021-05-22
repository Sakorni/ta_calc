import 'package:flutter/widgets.dart';
import 'package:ta_calc/models/calculator.dart';
import 'package:ta_calc/models/operations/abstract/reg_operation.dart';

class DecodeProvider with ChangeNotifier {
  Calculator _calc = Calculator();
  List<List<int>> codes = [];
  List<RegOpeartion> operations = [];

  void decode(BigInt number) {
    var newCode = _calc.decode(number);
    codes.add(newCode);
    operations.add(
      RegOpeartion.fromList(newCode),
    );
    notifyListeners();
  }

  void reset() {
    codes.clear();
    operations.clear();
    notifyListeners();
  }
}
