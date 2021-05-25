enum CalcMode { encode, decode }

enum Operation { ins, inc, dec, condition, stop }

extension OperationPattern on Operation {
  List<String> getPattern() {
    List<String> res;
    switch (this) {
      case Operation.ins:
        res = ['X', '<-'];
        break;
      case Operation.inc:
        res = ['X', '+'];
        break;
      case Operation.dec:
        res = ['X', '-'];
        break;
      case Operation.condition:
        res = ['If X', '(condition) goto', 'else goto'];
        break;
      case Operation.stop:
        res = ['Stop'];
        break;
    }
    return res;
  }

  String asString() {
    String res = '';
    switch (this) {
      case Operation.ins:
        res = "INS";
        break;
      case Operation.inc:
        res = "+";
        break;
      case Operation.dec:
        res = "-";
        break;
      case Operation.condition:
        res = "IF";
        break;
      case Operation.stop:
        res = "STOP";
        break;
    }
    return res;
  }
}
