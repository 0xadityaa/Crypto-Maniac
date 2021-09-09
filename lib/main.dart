import 'package:crypto_meniac/UI/App%20UI/Home%20Page/HomePage.dart';
import 'package:crypto_meniac/UI/Landing%20UI/LandingPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: authCheck(),
    );
  }
}

authCheck() {
  if (FirebaseAuth.instance.currentUser == null) {
    return LandingPage();
  } else {
    return HomePage();
  }
}
