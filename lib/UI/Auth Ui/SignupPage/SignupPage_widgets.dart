import 'package:crypto_meniac/Firebase/Auth/googleAuth.dart';
import 'package:crypto_meniac/UI/Auth%20Ui/LoginPage/LoginPage.dart';
import 'package:crypto_meniac/UI/HomePage.dart';
import 'package:flutter/material.dart';

Widget createSignupPage({
  required String imgPath,
  required TextEditingController emailController,
  required TextEditingController passwdController,
  required BuildContext context,
  // required Widget signupPage,
}) {
  return Scaffold(
    body: Container(
      color: Colors.blue[300],
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Center(
                  child: Text("Create Account",
                      style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                ),
                Image.asset(
                  imgPath,
                  height: 250.0,
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "First name",
                          ),
                        ),
                        SizedBox(height: 30.0),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "Last name",
                          ),
                        ),
                        SizedBox(height: 30.0),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "Email address",
                          ),
                        ),
                        SizedBox(height: 30.0),
                        TextField(
                          controller: passwdController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                          ),
                        ),
                        SizedBox(height: 30.0),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 50.0,
                            width: 250.0,
                            decoration: BoxDecoration(
                              color: Color(0XFF347AF0),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Center(
                              child: Text(
                                "Let's Get Started",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        GestureDetector(
                          onTap: () {
                            try {
                              googleSignin().whenComplete(() =>
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => HomePage())));
                            } catch (err) {
                              print(err);
                            }
                          },
                          child: Container(
                            height: 50.0,
                            width: 250.0,
                            decoration: BoxDecoration(
                              color: Color(0XFF347AF0),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 1.0,
                                ),
                                Image.asset(
                                  "assets/icons/google.png",
                                  height: 40.0,
                                ),
                                Text(
                                  " Continue with google",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19.0,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                  fontSize: 15.0, color: Color(0XFF485068)),
                            ),
                            SizedBox(
                              width: 3.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color(0XFF347AF0),
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
