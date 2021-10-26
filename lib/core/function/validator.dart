bool emailValidator(String value) {
  String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z.]{2,400}$";
  RegExp regExp = RegExp(pattern);
  // Yanlış olduğunda true döner
  return !regExp.hasMatch(value);
}

bool passwordValidator(String value) {
  String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}
