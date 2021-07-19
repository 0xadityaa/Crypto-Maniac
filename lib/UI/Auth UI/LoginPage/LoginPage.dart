import 'package:crypto_meniac/UI/Auth%20UI/LoginPage/LoginPage_widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    bool isHidden = true;
    return createLoginPage(
      context: context,
      titleText: "Let’s Sign you in.",
      subText1: "Welcome back.",
      subText2: "You have been missed!",
      emailController: emailController,
      passwordController: passwordController,
      isHidden: isHidden,
    );
  }
}
