import 'package:ta_calc/models/operations/concrete/dec_var_operation.dart';
import 'package:ta_calc/models/operations/concrete/if_operation.dart';
import 'package:ta_calc/models/operations/concrete/inc_var_operation.dart';
import 'package:ta_calc/models/operations/concrete/inser_var_operation.dart';
import 'package:ta_calc/models/operations/concrete/stop_operation.dart';
import 'package:ta_calc/resources/exceptions.dart';

abstract class RegOpeartion {
  ///Position of this opeartion in a programm
  int position = 0;

  ///Weight of an operation
  int weight = 0;
  RegOpeartion({required this.position, required this.weight});

  ///Returns a "code-like" view of this operation
  String toString();

  ///Returns the presentation for calculating it's code
  List<int> getNumberOpeartion();

  factory RegOpeartion.fromList(List<int> list) {
    if (list.first == 1 && list.length == 4) {
      return InsertVarOpeartion(
        lineIndex: list[1],
        varIndex: list[2],
        value: list[3],
      );
    } else if (list.first == 2 && list.length == 3) {
      return IncVarOpeartion(
        lineIndex: list[1],
        varIndex: list[2],
      );
    } else if (list.first == 3 && list.length == 3) {
      return DecVarOperation(
        position: list[1],
        varIndex: list[2],
      );
    } else if (list.first == 4 && list.length == 5) {
      return IfOperation(
        position: list[1],
        varIndex: list[2],
        trueIndex: list[3],
        falseIndex: list[4],
      );
    } else if (list.first == 5 && list.length == 2) {
      return StopOpeartion(
        pos: list[1],
      );
    } else {
      throw InvalidCode("Invalid input data");
    }
  }
}
