import 'package:ta_calc/models/reg_operation.dart';

abstract class VarOpeartion extends RegOpeartion {
  int varIndex = 0;
  VarOpeartion({
    required int position,
    required int weight,
    required this.varIndex,
  }) : super(position: position, weight: weight);
}
