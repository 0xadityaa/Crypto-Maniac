import 'package:crypto_meniac/UI/Auth%20Ui/LoginPage/LoginPage_widgets.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
