import 'package:ta_calc/models/var_operation.dart';

///Contains Inc Dec and Ins value
abstract class ValVarOpeartion extends VarOpeartion {
  ///Value, inserted in a variable
  int value;
  ValVarOpeartion({
    required int position,
    required int varIndex,
    this.value = 1,
    required int weight,
  }) : super(position: position, varIndex: varIndex, weight: weight);
}
