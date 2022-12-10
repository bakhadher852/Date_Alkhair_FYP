// ignore_for_file: unnecessary_this

extension StringExtensions on String {
  bool isValidEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }

//https://stackoverflow.com/questions/16800540/how-should-i-check-if-the-input-is-an-email-address-in-flutter/61512807#61512807
  bool isWhitespace() => this.trim().isEmpty;

  bool isValidDouble() => double.tryParse(this) != null;
  bool isValidInt() => int.tryParse(this) != null;
}
