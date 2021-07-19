import 'package:crypto_meniac/UI/App%20UI/HomePage.dart';
import 'package:crypto_meniac/UI/Landing%20UI/LandingPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
