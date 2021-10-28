import 'package:flutter/material.dart';
import 'package:startup_namer/core/widget/text_form_field_widget.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback? onButtonPressed;

  const LoginPage({Key? key, @required this.onButtonPressed}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: <Widget>[
                    TextFormFieldWidget(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'The Username cannot be empty';
                        }
                        return null;
                      },
                      labelText: 'Username',
                    ),
                    const SizedBox(height: 8.0),
                    TextFormFieldWidget(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'The Password cannot be empty';
                        }
                        return null;
                      },
                      labelText: 'Password',
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          widget.onButtonPressed!();
                        }
                      },
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
