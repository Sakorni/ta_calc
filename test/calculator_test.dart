import 'package:flutter_test/flutter_test.dart';
import 'package:ta_calc/models/calculator.dart';

void main() {
  test(
    "Testing calculator's encoding",
    () {
      Calculator calc = Calculator();
      expect(
        calc.encode(
          [1, 2, 1, 1],
        ),
        132300,
      );
      expect(
        calc.encode(
          [4, 1, 2, 3, 2],
        ),
        115046316000,
      );
    },
  );
  test(
    "Testing calculator's decoding",
    () {
      Calculator calc = Calculator();
      expect(
        calc.decode(
          132300,
        ),
        [1, 2, 1, 1],
      );
      expect(
        calc.decode(
          115046316000,
        ),
        [4, 1, 2, 3, 2],
      );
    },
  );
}
