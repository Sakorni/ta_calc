import 'package:flutter/widgets.dart';
import 'package:ta_calc/models/calculator.dart';
import 'package:ta_calc/models/decoder/decoder_delegate.dart';
import 'package:ta_calc/models/operations/abstract/reg_operation.dart';
import 'package:ta_calc/resources/exceptions.dart';

class DecodeProvider with ChangeNotifier {
  final DecoderDelegate delegate;
  List<String> sources = [];
  List<String> results = [];
  bool exceptionThrown = false;
  String exceptionCaption = "";

  DecodeProvider(this.delegate);

  void decode(String number) {
    try {
      if (number.isNotEmpty) {
        var res = delegate.calc(number);
        sources.add(number);
        results.add(res);
      }
    } on InvalidCode catch (e) {
      exceptionThrown = true;
      exceptionCaption = e.message;
    }
    notifyListeners();
    exceptionThrown = false;
  }

  void reset() {
    sources.clear();
    results.clear();
    notifyListeners();
  }
}
