import 'package:crypto_meniac/Firebase/Auth/googleAuth.dart';
import 'package:crypto_meniac/UI/Auth%20Ui/LoginPage/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     CircleAvatar(
      //       backgroundImage: NetworkImage(user.photoURL!),
      //     ),
      //     Text("Name : " + user.displayName!),
      //     Text("Email : " + user.email!),
      //     Text("UserId : " + user.uid),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            logOut().whenComplete(() => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginPage())));
          },
          color: Colors.blue,
          child: Text("Logout"),
        ),
      ),
      //   ],
      // ),
    );
  }
}
