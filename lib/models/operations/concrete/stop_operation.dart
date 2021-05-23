import 'package:ta_calc/models/operations/abstract/reg_operation.dart';

///Implements "stop" command in regMachine
class StopOpeartion extends RegOpeartion {
  static const int _weight = 5;
  StopOpeartion({required int pos}) : super(position: pos, weight: _weight);
  @override
  String toString() {
    return "$position: stop.";
  }

  @override
  List<int> getNumberOpeartion() {
    return [_weight, position];
  }
}
