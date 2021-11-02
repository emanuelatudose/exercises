import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:startup_namer/core/validation/validation_mixin.dart';
import 'package:startup_namer/feature/login/data/model/enum/field_error.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> with ValidationMixin {
  LoginBloc() : super(LoginState());

  @override
  LoginState get initialState => LoginState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginSubmittedEvent) {
      yield LoginState(isBusy: true);

      if (isFieldEmpty(event.username)) {
        yield LoginState(usernameError: FieldError.Empty);
        return;
      }

      if (!usernameValid(event.username)) {
        yield LoginState(usernameError: FieldError.Invalid);
        return;
      }

      if (isFieldEmpty(event.password)) {
        yield LoginState(passwordError: FieldError.Empty);
        return;
      }

      if (!passwordValid(event.password)) {
        yield LoginState(passwordError: FieldError.Invalid);
        return;
      }

      yield LoginState(submissionSuccess: true);
    }
  }
}
