import 'package:crypto_meniac/Firebase/Auth/emailAuth.dart';
import 'package:crypto_meniac/Firebase/Auth/googleAuth.dart';
import 'package:crypto_meniac/UI/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

bool signinSucess = false;
Widget createLoginPage({
  required String titleText,
  required String subText1,
  required String subText2,
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required bool isHidden,
  required BuildContext context,
}) {
  return Scaffold(
    backgroundColor: Color(0XFF0B0D12),
    appBar: AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: false,
      backgroundColor: Color(0XFF0B0D12),
      title: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          size: 35.0,
        ),
      ),
    ),
    body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50.0),
            Text(
              titleText,
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: Color(0XFFFFFFFF),
              ),
            ),
            Text(
              subText1,
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                  color: Color(0XFFBDC1C6)),
            ),
            Text(
              subText2,
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                  color: Color(0XFFBDC1C6)),
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              width: 358.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: Color(0XFF2F384A),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: TextField(
                  controller: emailController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                      hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500)),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: 358.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: Color(0XFF2F384A),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500)),
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  if (emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    login(
                            isLogin: true,
                            email: emailController.text,
                            password: passwordController.text)
                        .whenComplete(() => Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(
                                builder: (context) => HomePage())));
                  } else {
                    print("Error, LOL😄");
                  }
                },
                child: Container(
                  width: 250.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Color(0XFFFFFFFF),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: Text(
                "OR",
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Color(
                    0XFFBDC1C6,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  try {
                    googleSignin().whenComplete(() => signinSucess = true);
                  } catch (err) {
                    print("Error, LOL😄" + err.toString());
                    signinSucess = false;
                  }
                  signinSucess
                      ? Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage()))
                      : print("Error, LOL😄");
                  // then((value) => Navigator.of(context).push(
                  // MaterialPageRoute(builder: (context) => HomePage())));
                },
                child: Container(
                  width: 250.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Color(0XFFFFFFFF),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(FontAwesomeIcons.google),
                      Text(
                        "Continue with google",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0XFFBDC1C6),
                  ),
                ),
                Text(
                  "Register",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFFBDC1C6)),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
