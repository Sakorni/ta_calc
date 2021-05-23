import 'package:ta_calc/models/calculator.dart';
import 'package:ta_calc/models/decoder/decoder_delegate.dart';
import 'package:ta_calc/models/operations/abstract/reg_operation.dart';

class CodeToListAndOperation extends DecoderDelegate {
  Calculator _calc = Calculator();
  @override
  String calc(String source) {
    var bigInt = BigInt.tryParse(source) ?? BigInt.one;
    var code = _calc.decode(bigInt);
    var operation = RegOpeartion.fromList(code);
    return "$code\n$operation";
  }
}
