import 'package:crypto_meniac/UI/Auth%20UI/SignupPage/SignupPage_widgets.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final usernameController = TextEditingController();
    return createRegisterPage(
      titleText: "Welcome to",
      subText1: "Crypto Maniac",
      subText2: "Join the party.",
      emailController: emailController,
      passwordController: passwordController,
      usernameController: usernameController,
      context: context,
    );
  }
}
