import 'package:ta_calc/models/reg_line.dart';

abstract class VarLine extends RegLine {
  int varIndex = 0;
  VarLine({
    required int position,
    required int weight,
    required this.varIndex,
  }) : super(position: position, weight: weight);
}
