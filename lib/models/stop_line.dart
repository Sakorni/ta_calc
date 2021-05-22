import 'package:ta_calc/models/reg_line.dart';

///Implements "stop" command in regMachine
class StopLine extends RegLine {
  static const int _weight = 5;
  StopLine({required int pos}) : super(position: pos, weight: _weight);
  @override
  String getLineView() {
    return "$position: stop.";
  }

  @override
  List<int> getNumberLine() {
    return [_weight, position];
  }
}
