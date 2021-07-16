import 'dart:ui';

import 'package:flutter/material.dart';

Widget createLandingPage({required String imgPath, required String bodyText}) {
  return Scaffold(
    backgroundColor: Color(0XFF0B0D12),
    appBar: AppBar(
      centerTitle: true,
      backgroundColor: Color(0XFF0B0D12),
      elevation: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Crypto ",
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
          Text(
            "Maniac",
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Color(0XFFBDC1C6)),
          ),
        ],
      ),
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 320.0,
          height: 298.0,
          child: Image.asset(imgPath),
        ),
        Center(
            child: Text(bodyText,
                style: TextStyle(color: Color(0XFFBDC1C6), fontSize: 25.0))),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 150.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Color(0XFF96839D),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: Text("Register", style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.w600),),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 150.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Color(0XFFFFFFFF),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                  child: Text("Login", style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.w600),),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
