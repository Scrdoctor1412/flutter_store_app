class Failure {
  final String message;
  Failure({this.message = "An unknown error occured."});

  @override
  String toString() {
    return 'Failutre(message: $message)';
  }
}
