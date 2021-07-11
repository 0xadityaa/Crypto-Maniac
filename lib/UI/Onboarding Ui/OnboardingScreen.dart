import 'package:crypto_meniac/UI/Auth%20Ui/LoginPage/LoginPage.dart';
import 'package:flutter/material.dart';
import 'OnboardingScreen_widgets.dart';

class OnboardingScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return createOnboardingPage(
      titleText: "\t\t\tWelcome to \nCrypto Maniac",
      bodyText:
          "Manage all your crypto assets! It’s simple \n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tand easy! ",
      context: context,
      nextPage: OnboardingScreen2(),
      path: "assets/images/OB1.png",
      skipPage: SignupPage(),
      colorDot1: Color(0XFF347AF0),
      colorDot2: Color(0XFFEDF1F9),
      colorDot3: Color(0XFFEDF1F9),
      colorDot4: Color(0XFFEDF1F9),
      finalBtn: false,
    );
  }
}

class OnboardingScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return createOnboardingPage(
      titleText: "Nice and Tidy Crypto \n \t\t\t\t\t\t\t\t\t\t\tPortfolio!",
      bodyText:
          "Trade amongst the wide range\n\t\t\t\t\t\t\t\t\t\t\tof 8427 Cryptos",
      context: context,
      nextPage: OnboardingScreen3(),
      path: "assets/images/OB2.png",
      skipPage: SignupPage(),
      colorDot1: Color(0XFFEDF1F9),
      colorDot2: Color(0XFF347AF0),
      colorDot3: Color(0XFFEDF1F9),
      colorDot4: Color(0XFFEDF1F9),
      finalBtn: false,
    );
  }
}

class OnboardingScreen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return createOnboardingPage(
      titleText: "Buy and Sell Cryptos \n \t\t\t\t\t\t\t\t\tin real-time!",
      bodyText:
          "\t\t\t\t\t\t\t\t\t\t\t\t\t\tGet real insight of how \n Crypto trading and investing works",
      context: context,
      nextPage: OnboardingScreen4(),
      path: "assets/images/OB3.png",
      skipPage: SignupPage(),
      colorDot1: Color(0XFFEDF1F9),
      colorDot2: Color(0XFFEDF1F9),
      colorDot3: Color(0XFF347AF0),
      colorDot4: Color(0XFFEDF1F9),
      finalBtn: false,
    );
  }
}

class OnboardingScreen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return createOnboardingPage(
      titleText: "Get everything at \n \t\t\t\t\t one place!",
      bodyText:
          "\t\t\t\t\t\tGet all usefull resources \n related to crypto at one place",
      context: context,
      nextPage: SignupPage(),
      path: "assets/images/OB4.png",
      skipPage: SignupPage(),
      colorDot1: Color(0XFFEDF1F9),
      colorDot2: Color(0XFFEDF1F9),
      colorDot3: Color(0XFFEDF1F9),
      colorDot4: Color(0XFF347AF0),
      finalBtn: true,
    );
  }
}
