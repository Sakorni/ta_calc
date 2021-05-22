typedef void NumberHandler(int number);
typedef void AddHandler();
typedef void DeleteHandler();

abstract class NumPadDelegate {
  void numberPressed(int number);

  void addPressed();

  void deletePressed();

  void deleteAllPressed();

  void calculate();
}
