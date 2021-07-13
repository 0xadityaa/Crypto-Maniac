import 'package:crypto_meniac/UI/Auth%20Ui/LoginPage/LoginPage_widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = new TextEditingController();

  final passwdController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return createLoginPage(
      imgPath: "assets/images/LG.png",
      emailController: emailController,
      passwdController: passwdController,
      context: context,
    ); //signupPage: signupPage());
  }
}
