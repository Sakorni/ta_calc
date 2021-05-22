import 'package:ta_calc/models/abstract/var_operation.dart';

///Contains Inc Dec and Ins value
abstract class ValVarOpeartion extends VarOpeartion {
  ///Value, inserted in a variable
  int value;
  String _operationSymbol;
  ValVarOpeartion({
    required int position,
    required int varIndex,
    this.value = 1,
    required int weight,
    required String operationSymbol,
  })  : _operationSymbol = operationSymbol,
        super(position: position, varIndex: varIndex, weight: weight);

  @override
  List<int> getNumberOpeartion() {
    return [weight, position, varIndex, value];
  }

  @override
  String getOpeartionView() {
    return "$position: ${getVarView()} $_operationSymbol $value";
  }
}
