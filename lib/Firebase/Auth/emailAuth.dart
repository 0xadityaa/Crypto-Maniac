import 'package:firebase_auth/firebase_auth.dart';

Future<bool> login(
    {required bool isLogin,
    required String email,
    required String password}) async {
  try {
    if (isLogin) {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } else {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    }
    return true;
  } catch (err) {
    return false;
  }
}
