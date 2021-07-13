import 'package:crypto_meniac/UI/Auth%20Ui/SignupPage/SignupPage_widgets.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = new TextEditingController();

  final passwdController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return createSignupPage(
      imgPath: "assets/images/SU.png",
      emailController: emailController,
      passwdController: passwdController,
      context: context,
    );
  }
}
