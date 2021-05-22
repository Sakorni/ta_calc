abstract class RegLine {
  int position = 0;
  int weight = 0;
  RegLine({required this.position, required this.weight});
  String getLineView();
  List<int> getNumberLine();
}
