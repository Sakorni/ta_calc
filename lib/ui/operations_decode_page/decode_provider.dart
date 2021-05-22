import 'package:flutter/widgets.dart';
import 'package:ta_calc/models/calculator.dart';
import 'package:ta_calc/models/operations/abstract/reg_operation.dart';
import 'package:ta_calc/resources/exceptions.dart';
import 'package:ta_calc/ui/num_pad_delegate.dart';

class DecodeProvider with ChangeNotifier implements NumPadDelegate {
  String _buffer = "";
  Calculator _calc = Calculator();
  List<List<int>> codes = [];
  List<RegOpeartion> operations = [];

  void decode(BigInt number) {
    try {
      var newCode = _calc.decode(number);
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
    _buffer = "";
    notifyListeners();
  }

  @override
  void addPressed() {
    return;
  }

  @override
  void calculate() {
    if (_buffer.isNotEmpty) {
      decode(
        BigInt.parse(
          _buffer.toString(),
        ),
      );
    }
  }

  @override
  void deleteAllPressed() {
    reset();
  }

  @override
  void deletePressed() {
    if (_buffer.isNotEmpty) {
      _buffer = _buffer.substring(0, _buffer.length - 1);
    }
  }

  @override
  void numberPressed(int number) {
    _buffer += number.toString();
  }
}
