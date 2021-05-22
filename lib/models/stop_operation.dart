import 'package:ta_calc/models/reg_operation.dart';

///Implements "stop" command in regMachine
class StopOpeartion extends RegOpeartion {
  static const int _weight = 5;
  StopOpeartion({required int pos}) : super(position: pos, weight: _weight);
  @override
  String getOpeartionView() {
    return "$position: stop.";
  }

  @override
  List<int> getNumberOpeartion() {
    return [_weight, position];
  }
}
