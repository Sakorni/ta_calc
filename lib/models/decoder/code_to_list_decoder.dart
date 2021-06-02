import 'package:ta_calc/models/calculator.dart';
import 'package:ta_calc/models/decoder/decoder_delegate.dart';
import 'package:ta_calc/resources/exceptions.dart';

class CodeToListDecoder implements DecoderDelegate {
  Calculator _calc = Calculator();
  @override
  String calc(String source) {
    try {
      var bigInt = BigInt.tryParse(source) ?? BigInt.one;
      var code = _calc.decode(bigInt);
      return "$code\n";
    } on InvalidCode catch (e) {
      return e.message;
    }
  }
}
