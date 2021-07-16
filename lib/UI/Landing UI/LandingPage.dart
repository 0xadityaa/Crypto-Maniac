import 'package:crypto_meniac/UI/Landing%20UI/LandingPage_widget.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return createLandingPage(
        imgPath: "assets/images/LandingImg.png",
        bodyText:
            "\t\t\t\t\t\tKeeps track of all your\n\t\t\t\tcrypto assets and keeps\n\t\t\t\t\t\tyou updated with all the\n\t\t\t\t\t\tusefull crypto news to\nhelp you make better decisions");
  }
}
