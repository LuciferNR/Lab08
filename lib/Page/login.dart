import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:lab08/Page/register.dart';
import 'package:lab08/sevices/auth_service.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SafeArea(
        child: GoogleAuthButton(
          onPressed: () {
            GoogleAuthService().signinWithGoogle().then((value) {
              print(value.user!.uid);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Register(),
                  ));
            });
          },
        ),
      ),
    );
  }
}
