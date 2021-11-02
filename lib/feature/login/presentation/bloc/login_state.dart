part of 'login_bloc.dart';

class LoginState {
  final bool isBusy;
  final FieldError? usernameError;
  final FieldError? passwordError;
  final bool? submissionSuccess;

  LoginState({
    this.isBusy = false,
    this.usernameError,
    this.passwordError,
    this.submissionSuccess,
  });
}
