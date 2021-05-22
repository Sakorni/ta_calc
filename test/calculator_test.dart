import 'package:flutter_test/flutter_test.dart';
import 'package:ta_calc/models/calculator.dart';

void main() {
  test(
    "Testing calc computing",
    () {
      Calculator calc = Calculator();
      expect(
        calc.getCode(
          [1, 2, 1, 1],
        ),
        132300,
      );
      expect(
        calc.getCode(
          [4, 1, 2, 3, 2],
        ),
        115046316000,
      );
    },
  );
}
