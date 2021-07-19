import 'package:crypto_meniac/Firebase/Auth/googleAuth.dart';
import 'package:crypto_meniac/UI/App%20UI/AccountPage.dart';
import 'package:crypto_meniac/UI/App%20UI/MarketPage.dart';
import 'package:crypto_meniac/UI/App%20UI/NewsPage.dart';
import 'package:crypto_meniac/UI/App%20UI/PortfolioPage.dart';
import 'package:crypto_meniac/UI/Auth%20UI/LoginPage/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final screens = [
    Container(
      child: Center(
        child: Text("Home Page",style: TextStyle(color: Colors.white),),
      ),
    ),
    MarketPage(),
    NewsPage(),
    PortfolioPage(),
    AccountPage()
  ];
  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      backgroundColor: Color(0XFF0B0D12),
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
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0XFF0B0D12),
        elevation: 0.0,
        unselectedItemColor: Color(0XFFBDC1C6),
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.chartLine),
            label: "Market",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.solidNewspaper),
            label: "News",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.wallet),
            label: "Portfolio",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userAlt),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
