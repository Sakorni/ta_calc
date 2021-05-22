import 'package:ta_calc/models/operations/concrete/dec_var_operation.dart';
import 'package:ta_calc/models/operations/concrete/if_operation.dart';
import 'package:ta_calc/models/operations/concrete/inc_var_operation.dart';
import 'package:ta_calc/models/operations/concrete/inser_var_operation.dart';
import 'package:ta_calc/models/operations/concrete/stop_operation.dart';

abstract class RegOpeartion {
  ///Position of this opeartion in a programm
  int position = 0;

  ///Weight of an operation
  int weight = 0;
  RegOpeartion({required this.position, required this.weight});

  ///Returns a "code-like" view of this operation
  String getOpeartionView();

  ///Returns the presentation for calculating it's code
  List<int> getNumberOpeartion();

  factory RegOpeartion.fromList(List<int> list) {
    switch (list.first) {
      case 1:
        return InsertVarOpeartion(
          lineIndex: list[1],
          varIndex: list[2],
          value: list[3],
        );
      case 2:
        return IncVarOpeartion(
          lineIndex: list[1],
          varIndex: list[2],
        );
      case 3:
        return DecVarOperation(
          position: list[1],
          varIndex: list[2],
        );
      case 4:
        return IfOperation(
          position: list[1],
          varIndex: list[2],
          trueIndex: list[3],
          falseIndex: list[4],
        );
      case 5:
        return StopOpeartion(
          pos: list[1],
        );
      default:
        throw RangeError("List is badly formated");
    }
  }
}
