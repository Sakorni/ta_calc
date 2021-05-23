class InvalidCode implements Exception {
  String message;
  InvalidCode([this.message = "Invalid code"]);
}
