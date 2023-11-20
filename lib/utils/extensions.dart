extension StringExtension on String {
  bool get isValidEmail {
    final RegExp regExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return regExp.hasMatch(this);
  }

  bool get isValidPassword {
    final RegExp regExp = RegExp("^(?=.*[A-Z])");
    final passwordIsValid = length > 7 && length < 21 && regExp.hasMatch(this);
    return passwordIsValid;
  }
}
