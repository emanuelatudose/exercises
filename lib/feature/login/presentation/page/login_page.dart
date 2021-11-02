import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:startup_namer/core/widget/text_form_field_widget.dart';
import 'package:startup_namer/feature/login/data/model/enum/field_error.dart';
import 'package:startup_namer/feature/login/presentation/bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback? onButtonPressed;

  const LoginPage({Key? key, @required this.onButtonPressed}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late LoginBloc _bloc;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    _bloc = LoginBloc();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state.submissionSuccess == true) {
          widget.onButtonPressed!();
        }
      },
      child: Scaffold(
        body: BlocBuilder<LoginBloc, LoginState>(
          bloc: _bloc,
          builder: (context, state) {
            if (state.isBusy) {
              return const CircularProgressIndicator();
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: <Widget>[
                        TextFormFieldWidget(
                          controller: _usernameController,
                          labelText: 'Username',
                          hasFieldError: _hasUsernameError(state),
                          renderBorder: _renderUsernameBorder(state),
                          obscureText: false,
                        ),
                        if (_hasUsernameError(state)) ...[
                          const SizedBox(height: 5),
                          Text(
                            _usernameErrorText(state.usernameError),
                            style: const TextStyle(color: Colors.red),
                          ),
                        ],
                        const SizedBox(height: 8.0),
                        TextFormFieldWidget(
                          controller: _passwordController,
                          labelText: 'Password',
                          hasFieldError: _hasPasswordError(state),
                          renderBorder: _renderPasswordBorder(state),
                          obscureText: true,
                        ),
                        if (_hasPasswordError(state)) ...[
                          const SizedBox(height: 5),
                          Text(
                            _passwordErrorText(state.passwordError),
                            style: const TextStyle(color: Colors.red),
                          ),
                        ],
                        const SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () {
                            _bloc.add(LoginSubmittedEvent(
                                _usernameController.text,
                                _passwordController.text));
                          },
                          child: const Text('Login'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  bool _hasUsernameError(LoginState state) => state.usernameError != null;
  bool _hasPasswordError(LoginState state) => state.passwordError != null;

  String _usernameErrorText(FieldError? error) {
    switch (error) {
      case FieldError.Empty:
        return 'Please enter your username';
      case FieldError.Invalid:
        return 'Only letters, numbers ddg5dffand underscores are allowed';
      default:
        return '';
    }
  }

  String _passwordErrorText(FieldError? error) {
    switch (error) {
      case FieldError.Empty:
        return 'Please enter your password';
      case FieldError.Invalid:
        return 'Please enter minimum eight characters, at least one letter and one number';
      default:
        return '';
    }
  }

  UnderlineInputBorder _renderUsernameBorder(LoginState state) =>
      UnderlineInputBorder(
        borderSide: BorderSide(
            color: _hasUsernameError(state) ? Colors.red : Colors.black,
            width: 1),
      );

  UnderlineInputBorder _renderPasswordBorder(LoginState state) =>
      UnderlineInputBorder(
        borderSide: BorderSide(
            color: _hasPasswordError(state) ? Colors.red : Colors.black,
            width: 1),
      );
}
