
class AuthEx implements Exception{
  final String message;
  AuthEx(this.message);
  @override
  String toString() => message;
}