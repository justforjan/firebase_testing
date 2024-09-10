class RegexService {
  RegExp emailRegExp =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  bool isEmail(String? value) {
    if (value == null) {
      return false;
    }
    return emailRegExp.hasMatch(value);
  }
}
