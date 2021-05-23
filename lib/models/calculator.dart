import 'dart:math';

import 'package:ta_calc/resources/constants.dart';
import 'package:ta_calc/resources/exceptions.dart';

///Main computing entity for those codes
class Calculator {
  ///Encoding List of values into int code
  BigInt encode(List<int> values) {
    BigInt result = BigInt.one;
    for (int i = 0; i < values.length; ++i) {
      result *= BigInt.from(pow(primes[i], values[i] + 1));
    }
    return result;
  }

  ///Returning lise-like presentation of code
  List<int> decode(BigInt code) {
    List<int> res = [];

    for (int i = 0; code != BigInt.one; ++i) {
      int counter = 0;
      if (i >= primes.length || BigInt.from(primes[i]) > code) {
        throw InvalidCode();
      }
      while (code % BigInt.from(primes[i]) == BigInt.zero) {
        code ~/= BigInt.from(primes[i]);
        counter++;
      }
      if (counter == 0) {
        throw InvalidCode();
      }
      res.add(counter - 1);
    }
    return res;
  }
}
