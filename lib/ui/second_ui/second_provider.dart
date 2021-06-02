import 'package:flutter/cupertino.dart';
import 'package:ta_calc/models/decoder/code_to_list_decoder.dart';
import 'package:ta_calc/models/decoder/list_to_code_decoder.dart';

class SecondProvider with ChangeNotifier {
  String str = "";
  String ans = "";
  ListToCodeDecoder listCodeDecoder = ListToCodeDecoder();
  CodeToListDecoder codeToListDecoder = CodeToListDecoder();
  void buttonPressed(String button) {
    int? t = int.tryParse(button);
    if (t != null) {
      str += button;
    } else {
      switch (button) {
        case "%":
          break;
        case "CE":
          str = "";
          break;
        case "C":
          str = "";
          break;
        case "⌫":
          str = str.substring(0, str.length - 1);
          break;
        case "1/x":
          break;
        case "^":
          break;
        case "⌫":
          break;
        case "√":
          break;
        case "/":
          break;
        case "×":
          break;
        case "-":
          break;
        case "+":
          break;
        case ",":
          if (!str.endsWith(",") & (str.isNotEmpty)) {
            str += ",";
          }
          break;
        case "=":
          break;
        case "listToCode":
          ans = listCodeDecoder.calc(str);
          break;
        case "codeToList":
          ans = codeToListDecoder.calc(str);
          break;
        case "codeToOpers":
          break;
      }
    }
    notifyListeners();
  }
}
