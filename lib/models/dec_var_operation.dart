import 'package:ta_calc/models/value_var_operation.dart';

/// Presents the var - value operation
class DecVarOperation extends ValVarOpeartion {
  DecVarOperation({
    required int position,
    required int varIndex,
    int value = 1,
  }) : super(
          operationSymbol: "-",
          position: position,
          varIndex: varIndex,
          weight: 3,
          value: value,
        );

  @override
  List<int> getNumberOpeartion() {
    // TODO: implement getNumberOpeartion
    throw UnimplementedError();
  }

  @override
  String getOpeartionView() {
    // TODO: implement getOpeartionView
    throw UnimplementedError();
  }
}
