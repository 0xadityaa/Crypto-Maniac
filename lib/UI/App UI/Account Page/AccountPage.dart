import 'package:crypto_meniac/API/CoinApi.dart';
import 'package:crypto_meniac/Firebase/Auth/googleAuth.dart';
import 'package:crypto_meniac/UI/App%20UI/Account%20Page/AccountPage_widgets.dart';
import 'package:crypto_meniac/UI/Auth%20UI/LoginPage/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  static final List<String> items = ['INR', 'USD'];
  String value = items.first;
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      backgroundColor: Color(0XFF0B0D12),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.0,
            ),
            Text(
              "You are logged in with",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              user.email.toString(),
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                color: Color(0XFFBDC1C6),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Currency prefrence ",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              height: 60.0,
              width: 100.0,
              decoration: BoxDecoration(
                  color: Color(0XFF2F384A),
                  borderRadius: BorderRadius.circular(15.0)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonHideUnderline(
                  child: Theme(
                    data: Theme.of(context)
                        .copyWith(canvasColor: Color(0XFF0B0D12)),
                    child: DropdownButton<String>(
                      value: value,
                      items: items.map((item) {
                        return DropdownMenuItem<String>(
                          child: Text(
                            item,
                            style: TextStyle(color: Colors.white),
                          ),
                          value: item,
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          this.value = value!;
                          // print(_dropDownValue);
                        });
                        if (value == "USD") {
                          setState(() {
                            currency = 'usd';
                          });
                          print(currency);
                        } else {
                          setState(() {
                            currency = 'inr';
                          });
                          print(currency);
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "App version",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "V 0.1.0 (BETA)",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                color: Color(0XFFBDC1C6),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Log out",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            GestureDetector(
              onTap: () {
                logOut().whenComplete(() => Navigator.of(context)
                    .pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginPage())));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Log out from your account",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Color(0XFFBDC1C6),
                    ),
                  ),
                  Icon(
                    Icons.logout,
                    color: Color(0XFFBDC1C6),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
