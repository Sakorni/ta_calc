import 'package:ta_calc/models/calculator.dart';
import 'package:ta_calc/models/decoder/decoder_delegate.dart';

class ListToCodeDecoder implements DecoderDelegate {
  Calculator _calc = Calculator();
  List<int> decode(String source) {
    return List<int>.from(
      source.replaceAll(RegExp(r"\[|\]"), "").split(", ").map(
            (e) => int.parse(e),
          ),
    );
  }

  @override
  String calc(String source) {
    var list = decode(source);
    BigInt res = _calc.encode(list);
    return res.toString();
  }
}
