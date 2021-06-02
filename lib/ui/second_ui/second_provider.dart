import 'package:flutter/cupertino.dart';
import 'package:ta_calc/models/BI_calc.dart';

import 'package:ta_calc/models/decoder/code_to_list_decoder.dart';
import 'package:ta_calc/models/decoder/list_to_code_decoder.dart';

class SecondProvider with ChangeNotifier {
  String line = "";
  String ans = "";
  ListToCodeDecoder listCodeDecoder = ListToCodeDecoder();
  CodeToListDecoder codeToListDecoder = CodeToListDecoder();
  BICalc calc = BICalc();

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
        case "listToCode":
          ans = listCodeDecoder.calc(line);
          break;
        case "codeToList":
          ans = codeToListDecoder.calc(line);
          break;
        case "codeToOpers":
          break;
        default:
          line += button;
      }
    }
    notifyListeners();
  }
}
