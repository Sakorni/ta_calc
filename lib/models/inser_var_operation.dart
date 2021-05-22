import 'package:ta_calc/models/value_var_operation.dart';

///Presentation of insert operation [x <- value]
class InsertVarOpeartion extends ValVarOpeartion {
  InsertVarOpeartion({
    required int lineIndex,
    required int varIndex,
    int value = 1,
  }) : super(
          operationSymbol: "<-",
          position: lineIndex,
          varIndex: varIndex,
          value: value,
          weight: 1,
        );
}
