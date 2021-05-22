abstract class RegOpeartion {
  ///Position of this opeartion in a programm
  int position = 0;

  ///Weight of an operation
  int weight = 0;
  RegOpeartion({required this.position, required this.weight});

  ///Returns a "code-like" view of this operation
  String getOpeartionView();

  ///Returns the presentation for calculating it's code
  List<int> getNumberOpeartion();
}
