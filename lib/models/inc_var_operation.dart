import 'package:ta_calc/models/value_var_operation.dart';

///Presentation of increment operation [x + value]
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
}
