import 'package:flutter_test/flutter_test.dart';
import 'package:ta_calc/models/calculator.dart';

void main() {
  test(
    "Testing calculator's encoding",
    () {
      Calculator calc = Calculator();
      expect(
        calc.encode(
          [5, 17],
        ),
        BigInt.from(24794911296),
      );
      expect(
        calc.encode(
          [2, 15, 2],
        ),
        BigInt.from(43046721000),
      );
      expect(
        calc.encode(
          [1, 2, 1, 1],
        ),
        BigInt.from(132300),
      );
      expect(
        calc.encode(
          [4, 1, 2, 3, 2],
        ),
        BigInt.from(115046316000),
      );
      expect(
        calc.encode(
          [1, 3, 2, 0, 0, 0],
        ),
        BigInt.from(40540500),
      );
      expect(
        calc.encode(
          [2, 3, 2, 0, 0, 0],
        ),
        BigInt.from(81081000),
      );
      expect(
        calc.encode(
          [6, 2, 2, 0, 2, 1],
        ),
        BigInt.from(680215536000),
      );
      expect(
        calc.encode(
          [6, 1, 2, 0, 3, 2],
        ),
        BigInt.from(32423607216000),
      );
      expect(
        calc.encode(
          [6, 3, 1, 3, 1, 0],
        ),
        BigInt.from(978939561600),
      );
      expect(
        calc.encode(
          [4, 14, 5, 15, 12],
        ),
        BigInt.parse("8231185182557408658845086140428308500000"),
      );
      expect(
        calc.encode(
          [4, 16, 2, 17, 3],
        ),
        BigInt.parse("12315634241973749428865283468000"),
      );
    },
  );
  test(
    "Testing calculator's decoding",
    () {
      Calculator calc = Calculator();
      expect(
        calc.decode(
          BigInt.from(24794911296),
        ),
        [5, 17],
      );
      expect(
        calc.decode(
          BigInt.from(132300),
        ),
        [1, 2, 1, 1],
      );
      expect(
        calc.decode(
          BigInt.from(115046316000),
        ),
        [4, 1, 2, 3, 2],
      );
      expect(
        calc.decode(
          BigInt.from(40540500),
        ),
        [1, 3, 2, 0, 0, 0],
      );
      expect(
        calc.decode(
          BigInt.from(81081000),
        ),
        [2, 3, 2, 0, 0, 0],
      );
      expect(
        calc.decode(
          BigInt.from(680215536000),
        ),
        [6, 2, 2, 0, 2, 1],
      );
      expect(
        calc.decode(
          BigInt.from(32423607216000),
        ),
        [6, 1, 2, 0, 3, 2],
      );
      expect(
        calc.decode(
          BigInt.from(978939561600),
        ),
        [6, 3, 1, 3, 1, 0],
      );
      expect(
        calc.decode(
          BigInt.parse("8231185182557408658845086140428308500000"),
        ),
        [4, 14, 5, 15, 12],
      );
      expect(
        calc.decode(
          BigInt.parse("12315634241973749428865283468000"),
        ),
        [4, 16, 2, 17, 3],
      );
    },
  );
}
