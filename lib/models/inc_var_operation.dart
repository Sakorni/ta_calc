import 'package:ta_calc/models/value_var_operation.dart';

class IncVarOpeartion extends ValVarOpeartion {
  IncVarOpeartion({
    required int lineIndex,
    required int varIndex,
    int value = 1,
  }) : super(
          operationSymbol: "+",
          position: lineIndex,
          varIndex: varIndex,
          weight: 2,
          value: value,
        );

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
