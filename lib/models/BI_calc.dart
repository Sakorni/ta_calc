import 'package:ta_calc/resources/strings.dart';

class BICalc {
  static const String _pattern = r'(\d+)(.)(\d+)';
  RegExp _regex = RegExp(_pattern);

  String doCalc(String source) {
    var matches = _regex.allMatches(source);
    if (matches.isEmpty) {
      return CalcStrings.invalid;
    }
    var groups = matches.first;
    BigInt? result;
    var firstNumber = BigInt.tryParse(groups.group(1).toString());
    var operation = groups.group(2).toString();
    var secondNumber = BigInt.tryParse(groups.group(3).toString());
    print(firstNumber);
    print(secondNumber);
    if (firstNumber == null || secondNumber == null) {
      return CalcStrings.invalid;
    } else {
      switch (operation) {
        case '*':
          {
            result = firstNumber * secondNumber;
          }
          break;
        case '+':
          {
            result = firstNumber + secondNumber;
          }
          break;
        case '-':
          {
            result = firstNumber - secondNumber;
          }
          break;
        case '/':
          {
            return (firstNumber / secondNumber).toString();
          }
        case '%':
          {
            result = firstNumber.remainder(secondNumber);
          }
          break;
        case '^':
          {
            result = firstNumber.pow(secondNumber.toInt());
          }
          break;
      }
    }
    return result?.toString() ?? CalcStrings.invalid;
  }
}
