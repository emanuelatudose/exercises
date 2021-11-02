mixin ValidationMixin {
  bool isFieldEmpty(String fieldValue) => fieldValue.isEmpty;

  bool usernameValid(String username) {
    return RegExp(r'^[a-zA-Z0-9_\.]+$').hasMatch(username);
  }

  bool passwordValid(String password) {
    return RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}').hasMatch(password);
  }
}
