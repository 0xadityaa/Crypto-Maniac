import 'package:crypto_meniac/API/CoinApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String? _dropDownValue;

Widget createAccountPage ({required String loginEmail}) {
  return Scaffold(
    backgroundColor: Color(0XFF0B0D12),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40.0,
        ),
        Text(
          "You are logged in with",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          loginEmail,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
            color: Color(0XFFBDC1C6),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          "Currency prefrence ",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Container(
          height: 60.0,
          width: 100.0,
          decoration: BoxDecoration(
              color: Color(0XFF2F384A),
              borderRadius: BorderRadius.circular(15.0)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
              hint: _dropDownValue == null
                  ? Text('INR',style: TextStyle(color: Colors.white),)
                  : Text(
                      _dropDownValue!,
                      style: TextStyle(color: Colors.white),
                    ),
              isExpanded: true,
              iconSize: 30.0,
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
              items: ['INR', 'USD'].map(
                (val) {
                  return DropdownMenuItem<String>(
                    value: val,
                    child: Text(val),
                  );
                },
              ).toList(),
              onChanged: (val) {
                _dropDownValue = val.toString();
                if (val == 'USD') {
                  currency = 'usd';
                } else {
                  currency = 'inr';
                }
              },
            ),
          ),
          // child: DropdownButtonHideUnderline(
          //   child: DropdownButton<String>(
          //     items: <String>['INR', 'USD'].map((String value) {
          //       return DropdownMenuItem<String>(
          //         value: value,
          //         child: Text(value,style: TextStyle(color: Colors.white),),
          //       );
          //     }).toList(),
          //     onChanged: (value) {
          //       value = value;
          //       if (value == "USD") {
          //         currency = 'usd';
          //       } else {
          //         currency = 'inr';
          //       }
          //     },
          //   ),
          // ),
        )
      ],
    ),
  );
}
