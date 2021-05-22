import 'package:ta_calc/models/var_line.dart';

class InsertVarLine extends VarLine {
  int value;
  InsertVarLine({
    required int lineIndex,
    required int varIndex,
    this.value = 1,
  }) : super(
          position: lineIndex,
          varIndex: varIndex,
          weight: 1,
        );

  String _getVarView() {
    StringBuffer res = StringBuffer("X");
    for (int i = 0; i < varIndex; ++i) {
      res.write("1");
    }
    return res.toString();
  }

  @override
  String getLineView() {
    return "$position:${_getVarView()}<-$value";
  }

  @override
  List<int> getNumberLine() {
    return [weight, position, varIndex, value];
  }
}
