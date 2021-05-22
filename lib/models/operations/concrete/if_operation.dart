import 'package:ta_calc/models/operations/abstract/var_operation.dart';

class IfOperation extends VarOpeartion {
  ///Index of an operation if condition is true
  int trueIndex;

  ///Index of an operation if condition is false
  int falseIndex;
  IfOperation({
    required this.trueIndex,
    required this.falseIndex,
    required int position,
    required int varIndex,
  }) : super(
          position: position,
          varIndex: varIndex,
          weight: 4,
        );

  @override
  List<int> getNumberOpeartion() {
    return [weight, position, varIndex, trueIndex, falseIndex];
  }

  @override
  String getOpeartionView() {
    return "$position: if ${getVarView()}(condition) goto $trueIndex else goto $falseIndex";
  }
}
