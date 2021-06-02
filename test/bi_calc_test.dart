import 'package:flutter_test/flutter_test.dart';
import 'package:ta_calc/models/BI_calc.dart';

void main() {
  BICalc calc = BICalc();
  test(
    "Testing add operation",
    () {
      expect(
        calc.doCalc("2+2"),
        equals("4"),
      );
      expect(
        calc.doCalc("1+2"),
        equals("3"),
      );
    },
  );
  test(
    "Testing subtr operation",
    () {
      expect(
        calc.doCalc("2-2"),
        equals("0"),
      );
      expect(
        calc.doCalc("3-1"),
        equals("2"),
      );
    },
  );
  test(
    "Testing reminder operation",
    () {
      expect(
        calc.doCalc("5%2"),
        equals("1"),
      );
      expect(
        calc.doCalc("9%10"),
        equals("9"),
      );
    },
  );
  test(
    "Testing pow operation",
    () {
      expect(
        calc.doCalc("2^10"),
        equals("1024"),
      );
      expect(
        calc.doCalc("5^3"),
        equals("125"),
      );
    },
  );
  test(
    "Testing bad operation",
    () {
      expect(
        calc.doCalc("2s10"),
        equals("Invalid input"),
      );
      expect(
        calc.doCalc("^"),
        equals("Invalid input"),
      );
    },
  );
}
