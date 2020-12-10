
class NetworkEx implements Exception{
  Exception exception;
  NetworkEx(this.exception);
  @override
  String toString() {
    return "Please check your internet connection - error ${exception.toString()}";
  }
}