import 'package:flutter_test/flutter_test.dart';
import 'package:ta_calc/models/operations/abstract/reg_operation.dart';
import 'package:ta_calc/models/operations/concrete/dec_var_operation.dart';
import 'package:ta_calc/models/operations/concrete/if_operation.dart';
import 'package:ta_calc/models/operations/concrete/inc_var_operation.dart';
import 'package:ta_calc/models/operations/concrete/inser_var_operation.dart';
import 'package:ta_calc/models/operations/concrete/stop_operation.dart';

void main() {
  group("Tests for parsing operations from List and to List", () {
    test(
      "Test of parsing IfOperation from and to list",
      () {
        List<int> code = [4, 1, 2, 3, 2];
        RegOpeartion op = RegOpeartion.fromList(code);
        expect(
          op,
          TypeMatcher<IfOperation>(),
          reason: "Parsing from code to IfOperation is broken",
        );
        IfOperation iOp = op as IfOperation;
        expect(
          iOp.getNumberOpeartion(),
          code,
          reason: "Parsing from IfOperation to code is broken",
        );
      },
    );
    test(
      "Test of parsing InsertOperation from and to list",
      () {
        List<int> code = [1, 2, 1, 1];
        RegOpeartion op = RegOpeartion.fromList(code);
        expect(
          op,
          TypeMatcher<InsertVarOpeartion>(),
          reason: "Parsing from code to InsertVarOpeartion is broken",
        );
        InsertVarOpeartion iOp = op as InsertVarOpeartion;
        expect(
          iOp.getNumberOpeartion(),
          code,
          reason: "Parsing from InsertVarOpeartion to code is broken",
        );
      },
    );

    test(
      "Test of parsing IncrementOperation from and to list",
      () {
        List<int> code = [
          2,
          1,
          3,
        ];
        RegOpeartion op = RegOpeartion.fromList(code);
        expect(
          op,
          TypeMatcher<IncVarOpeartion>(),
          reason: "Parsing from code to IncVarOpeartion is broken",
        );
        IncVarOpeartion iOp = op as IncVarOpeartion;
        expect(
          iOp.getNumberOpeartion(),
          code,
          reason: "Parsing from IncVarOpeartion to code is broken",
        );
      },
    );

    test(
      "Test of parsing DecrementOperation from and to list",
      () {
        List<int> code = [
          3,
          1,
          3,
        ];
        RegOpeartion op = RegOpeartion.fromList(code);
        expect(
          op,
          TypeMatcher<DecVarOperation>(),
          reason: "Parsing from code to DecVarOperation is broken",
        );
        DecVarOperation iOp = op as DecVarOperation;
        expect(
          iOp.getNumberOpeartion(),
          code,
          reason: "Parsing from DecVarOperation to code is broken",
        );
      },
    );
    test(
      "Test of parsing StopOperation from and to list",
      () {
        List<int> code = [
          5,
          3,
        ];
        RegOpeartion op = RegOpeartion.fromList(code);
        expect(
          op,
          TypeMatcher<StopOpeartion>(),
          reason: "Parsing from code to StopOpeartion is broken",
        );
        StopOpeartion iOp = op as StopOpeartion;
        expect(
          iOp.getNumberOpeartion(),
          code,
          reason: "Parsing from StopOpeartion to code is broken",
        );
      },
    );
  });
}
