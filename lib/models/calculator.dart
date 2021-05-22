import 'dart:math';

import 'package:ta_calc/resources/constants.dart';

class Calculator {
  int getCode(List<int> values) {
    int result = 1;
    for (int i = 0; i < values.length; ++i) {
      result *= pow(primes[i], values[i] + 1) as int;
    }
    return result;
  }
}
