import 'package:ta_calc/models/reg_operation.dart';

abstract class VarOpeartion extends RegOpeartion {
  int varIndex = 0;
  VarOpeartion({
    required int position,
    required int weight,
    required this.varIndex,
  }) : super(position: position, weight: weight);

  String getVarView() {
    StringBuffer res = StringBuffer("X");
    for (int i = 0; i < varIndex; ++i) {
      res.write("1");
    }
    return res.toString();
  }
}
