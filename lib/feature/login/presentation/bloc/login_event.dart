part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginSubmittedEvent extends LoginEvent {
  final String username;
  final String password;

  LoginSubmittedEvent(this.username, this.password);
}
