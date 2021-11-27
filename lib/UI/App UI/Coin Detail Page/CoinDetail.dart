import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_meniac/API/CoinApi.dart';
import 'package:crypto_meniac/API/MyCoinsAPI.dart';
import 'package:crypto_meniac/Firebase/Firestore%20DB/addCoin.dart';
import 'package:crypto_meniac/Firebase/Firestore%20DB/fetchData.dart';
import 'package:crypto_meniac/Firebase/Firestore%20DB/updateCoin.dart';
import 'package:crypto_meniac/UI/App%20UI/Market%20Page/MarketPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

TextEditingController _textFieldController = TextEditingController();
TextEditingController _textFieldController2 = TextEditingController();
int selectedIndex = 0;
int quantity = 0;
int dbIndex = 0;
final addCoin = new AddCoin();
final updateCoin = new UpdateCoin();
final user = FirebaseAuth.instance.currentUser!;
final fetchData = new FetchData();
List<Object?> data = [];
Map<dynamic, dynamic> myCoins = new Map<dynamic, dynamic>();

class CoinDetail extends StatefulWidget {
  const CoinDetail({Key? key}) : super(key: key);

  @override
  _CoinDetailState createState() => _CoinDetailState();
}

class _CoinDetailState extends State<CoinDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF0B0D12),
      appBar: AppBar(
        backgroundColor: Color(0XFF0B0D12),
        title: Text("Coin details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage(allCoinsData[selectedIndex]['image']),
                    radius: 30.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          allCoinsData[selectedIndex]['name'],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          allCoinsData[selectedIndex]['symbol'],
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 35.0),
                          Icon(
                            FontAwesomeIcons.rupeeSign,
                            color: Colors.white,
                          ),
                          Text(
                            allCoinsData[selectedIndex]['current_price']
                                .toStringAsFixed(0),
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          allCoinsData[selectedIndex][
                                      'price_change_percentage_24h_in_currency'] >
                                  0
                              ? Image.asset("assets/icons/upRightArrow.png")
                              : Image.asset("assets/icons/downRightArrow.png"),
                          Text(
                            " " +
                                allCoinsData[selectedIndex][
                                        'price_change_percentage_24h_in_currency']
                                    .toStringAsFixed(2) +
                                "%",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 420.0,
                width: 360.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: WebView(
                  initialUrl: graphUrl,
                  javascriptMode: JavascriptMode.unrestricted,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 150.0,
                width: 350.0,
                decoration: BoxDecoration(
                  color: Color(0XFF2F384A),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Market rank",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                              Text(
                                allCoinsData[selectedIndex]['market_cap_rank']
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "24h price change",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                              allCoinsData[selectedIndex]['price_change_24h'] >
                                      0
                                  ? Text(
                                      "₹ " +
                                          allCoinsData[selectedIndex]
                                                  ['price_change_24h']
                                              .toStringAsFixed(3),
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    )
                                  : Text(
                                      "₹ " +
                                          allCoinsData[selectedIndex]
                                                  ['price_change_24h']
                                              .toStringAsFixed(3),
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red),
                                    ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("24h highest",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                              Text(
                                "₹ " +
                                    allCoinsData[selectedIndex]['high_24h']
                                        .toString(),
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("24h lowest",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white)),
                              Text(
                                "₹ " +
                                    allCoinsData[selectedIndex]['low_24h']
                                        .toString(),
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _displayPurchaseInputDialog(context);
                      // Get.defaultDialog(
                      //     barrierDismissible: false,
                      //     title: "Select the quantity of purchase",
                      //     content: Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: TextFormField(
                      //         decoration: InputDecoration(
                      //             hintText: "Quantity", focusColor: Colors.white),
                      //         // onChanged: (value) {
                      //         //   quantity = value;
                      //         // },
                      //       ),
                      //     ),
                      //     textConfirm: "Save",
                      //     buttonColor: Colors.cyan,
                      //     textCancel: "Cancel",
                      //     onConfirm: () {
                      //       // if (quantity == "") {
                      //       //   Get.snackbar(
                      //       //       "Error", "Please input a valid quantity",
                      //       //       snackPosition: SnackPosition.TOP);
                      //       // } else {
                      //       addCoin
                      //           .add(
                      //             uid: user.uid,
                      //             coin_name: allCoinsData[selectedIndex]['name'],
                      //             coin_id: allCoinsData[selectedIndex]['id'],
                      //             buying_price: allCoinsData[selectedIndex]
                      //                 ['current_price'],
                      //             quantity: int.parse(quantity),
                      //             img_url: allCoinsData[selectedIndex]['image'],
                      //           )
                      //           .whenComplete(() => Get.snackbar(
                      //               "Success", "Transaction sucsessful",
                      //               snackPosition: SnackPosition.TOP));
                      //     },
                      //     // },
                      //     // setState(() {
                      //     //
                      //     // });
                      //     //   userPswds.add(generatedPassword);
                      //     //   print("Alias : $givenAlias");
                      //     //   pswdFor.add(givenAlias.toString());
                      //     //   Navigator.of(context, rootNavigator: true).pop();
                      //     //   if (givenAlias != null) {
                      //     //     Get.snackbar(
                      //     //         "Saved", "Your Password is saved Securly!",
                      //     //         snackPosition: SnackPosition.TOP);
                      //     //     setState(() {
                      //     //       generatedPassword = "Your pswd will be here";
                      //     //     });
                      //     //   } else {
                      //     //     Get.snackbar(
                      //     //         "Error", "Empty Password cannot be Saved",
                      //     //         snackPosition: SnackPosition.TOP);
                      //     //   }
                      //     // },
                      //     onCancel: () {
                      //       Get.snackbar("Error", "Tracnsaction canceled",
                      //           snackPosition: SnackPosition.TOP);
                      //       Navigator.of(context, rootNavigator: true).pop();
                      //     });
                    },
                    child: Container(
                      height: 50.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Center(
                        child: Text(
                          "BUY",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      fetchData.getCoins();
                      // getMyCoins();
                    },
                    child: GestureDetector(
                      onTap: () async {
                        await getData();
                        print(checkIfCoinExists());
                        if (checkIfCoinExists()) {
                          updateCoin.findDoc(
                              coinName: allCoinsData[selectedIndex]['name']);
                          // If selling quantity is less than users holdings
                          _displaySellInputDialog(context);
                        } else {
                          Get.snackbar(
                            "\tError",
                            "\tYou don't own any " +
                                allCoinsData[selectedIndex]['name'],
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Color(0XFF96839D),
                            icon: Image.asset(
                                "assets/icons/Snackbar_cross_icon.png"),
                            colorText: Colors.white,
                            duration: Duration(seconds: 5),
                          );
                        }
                      },
                      child: Container(
                        height: 50.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Center(
                          child: Text(
                            "SELL",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _displayPurchaseInputDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          'How much ' +
              allCoinsData[selectedIndex]['name'] +
              " would you like to buy?",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0XFF2F384A),
        content: TextField(
          style: TextStyle(color: Colors.white),
          controller: _textFieldController,
          decoration: InputDecoration(
            hintText: "Input Quantity",
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
        actions: <Widget>[
          MaterialButton(
            child: Text('CANCEL', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          MaterialButton(
            child: Text('OK', style: TextStyle(color: Colors.white)),
            onPressed: () {
              quantity = int.parse(_textFieldController.text);
              if (quantity == 0 || _textFieldController.text.isEmpty) {
                Navigator.pop(context);
                Get.snackbar(
                  "\tError",
                  "\tPlease input a valid quantity",
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Color(0XFF96839D),
                  icon: Image.asset("assets/icons/Snackbar_cross_icon.png"),
                  colorText: Colors.white,
                  duration: Duration(seconds: 5),
                );
              } else {
                addCoin
                    .add(
                      uid: user.uid,
                      coin_name: allCoinsData[selectedIndex]['name'],
                      coin_id: allCoinsData[selectedIndex]['id'],
                      buying_price: allCoinsData[selectedIndex]
                          ['current_price'],
                      quantity: quantity,
                      img_url: allCoinsData[selectedIndex]['image'],
                    )
                    .whenComplete(() => Get.snackbar(
                          "\tSuccess",
                          "\tTransaction sucsessful",
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Color(0XFF96839D),
                          colorText: Colors.white,
                          icon: Image.asset(
                              "assets/icons/Snackbar_tick_icon.png"),
                          duration: Duration(seconds: 5),
                        ));
                // print(_textFieldController.text);
                Navigator.pop(context);
              }
            },
          ),
        ],
      );
    },
  );
}

// TODO : Impliment Coin Updating Logic
// FIXME: Make a Logical condition to check if coin exists in database
Future<void> _displaySellInputDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          'How much ' +
              allCoinsData[selectedIndex]['name'] +
              " would you like to Sell?",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0XFF2F384A),
        content: TextField(
          style: TextStyle(color: Colors.white),
          controller: _textFieldController2,
          decoration: InputDecoration(
            hintText: "Input Quantity",
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
        actions: <Widget>[
          MaterialButton(
            child: Text('CANCEL', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          MaterialButton(
            child: Text('OK', style: TextStyle(color: Colors.white)),
            onPressed: () {
              quantity = int.parse(_textFieldController2.text);
              if (_textFieldController2.text.isEmpty) {
                Navigator.pop(context);
                Get.snackbar(
                  "\tError",
                  "\tPlease input a valid quantity",
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Color(0XFF96839D),
                  icon: Image.asset("assets/icons/Snackbar_cross_icon.png"),
                  colorText: Colors.white,
                  duration: Duration(seconds: 5),
                );
              } else {
                updateCoin
                    .update(
                        quantity: _textFieldController2.text, docID: tempDocID)
                    .whenComplete(() => Get.snackbar(
                          "\tSuccess",
                          "\tTransaction sucsessful",
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Color(0XFF96839D),
                          colorText: Colors.white,
                          icon: Image.asset(
                              "assets/icons/Snackbar_tick_icon.png"),
                          duration: Duration(seconds: 5),
                        ));
                // print(_textFieldController.text);
                Navigator.pop(context);
              }
            },
          ),
        ],
      );
    },
  );
}

bool checkIfCoinExists() {
  for (int i = 0; i < myCoins.length; i++) {
    if (myCoins[i].containsValue(allCoinsData[selectedIndex]['name'])) {
      // dbIndex = myCoins[i];
      return true;
    }
  }
  return false;
}

Future<void> getData() async {
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('coins');
  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _collectionRef.get();

  // Get data from docs and convert map to List

  final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
  data = allData;
  myCoins = data.asMap();
  print(myCoins);
}
