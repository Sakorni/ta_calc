import 'package:ta_calc/models/var_operation.dart';

class IncVarOpeartion extends VarOpeartion {
  int value;
  IncVarOpeartion({
    required int lineIndex,
    required int varIndex,
    this.value = 1,
  }) : super(position: lineIndex, varIndex: varIndex, weight: 2);

  @override
  String getOpeartionView() {
    // TODO: implement getOpeartionView
    throw UnimplementedError();
  }

  @override
  List<int> getNumberOpeartion() {
    // TODO: implement getNumberOpeartion
    throw UnimplementedError();
  }
}
