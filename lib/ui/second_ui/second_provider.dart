import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:ta_calc/models/BI_calc.dart';

import 'package:ta_calc/models/decoder/code_to_list_decoder.dart';
import 'package:ta_calc/models/decoder/list_to_code_decoder.dart';
import 'package:ta_calc/resources/strings.dart';

class SecondProvider with ChangeNotifier {
  String line = "";
  String ans = "";
  StreamController<String> _result = StreamController<String>.broadcast();
  Stream<String> get results => _result.stream;
  ListToCodeDecoder listCodeDecoder = ListToCodeDecoder();
  CodeToListDecoder codeToListDecoder = CodeToListDecoder();
  BICalc calc = BICalc();

  @override
  void dispose() {
    _result.close();
    super.dispose();
  }

  void buttonPressed(String button) {
    int? t = int.tryParse(button);
    if (t != null) {
      line += button;
    } else {
      switch (button) {
        case ",":
          if (!line.endsWith(",") & (line.isNotEmpty)) {
            line += ",";
          }
          break;
        case "C":
          line = "";
          break;
        case "⌫":
          line = line.substring(0, line.length - 1);
          break;
        case "=":
          {
            line = calc.doCalc(line);
          }
          break;
        case CalcStrings.transform:
          {
            var res = '';
            if (line.contains(',')) {
              res = listCodeDecoder.calc(line);
            } else {
              if (line.isNotEmpty) {
                res = codeToListDecoder.calc(line);
              }
            }
            _result.sink.add(res);
          }
          break;
        default:
          line += button;
      }
    }
    notifyListeners();
  }
}
