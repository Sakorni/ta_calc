import 'dart:math';

import 'package:ta_calc/resources/constants.dart';

///Main computing entity for those codes
class Calculator {
  ///Encoding List of values into int code
  int encode(List<int> values) {
    int result = 1;
    for (int i = 0; i < values.length; ++i) {
      result *= pow(primes[i], values[i] + 1) as int;
    }
    return result;
  }

  ///Returning lise-like presentation of code
  List<int> decode(int code) {
    List<int> res = [];

    for (int i = 0; code != 1; ++i) {
      int counter = 0;
      while (code % primes[i] == 0) {
        code ~/= primes[i];
        counter++;
      }
      res.add(counter - 1);
    }
    return res;
  }
}
