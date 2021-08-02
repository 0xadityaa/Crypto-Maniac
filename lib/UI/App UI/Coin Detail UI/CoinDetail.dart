import 'package:crypto_meniac/API/CoinApi.dart';
import 'package:crypto_meniac/Firebase/Firestore%20DB/addCoin.dart';
import 'package:crypto_meniac/UI/App%20UI/Market%20Page/MarketPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

int selectedIndex = 0;

class CoinDetail extends StatefulWidget {
  const CoinDetail({Key? key}) : super(key: key);

  @override
  _CoinDetailState createState() => _CoinDetailState();
}

class _CoinDetailState extends State<CoinDetail> {
  final addCoin = new AddCoin();
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF0B0D12),
      appBar: AppBar(
        backgroundColor: Color(0XFF0B0D12),
        title: Text("Coin details"),
        centerTitle: true,
      ),
      body: Padding(
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
                            allCoinsData[selectedIndex]['price_change_24h'] > 0
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
                    addCoin.add(
                      uid: user.uid,
                      coin_name: allCoinsData[selectedIndex]['name'],
                      coin_id: allCoinsData[selectedIndex]['symbol'],
                      buying_price: allCoinsData[selectedIndex]
                          ['current_price'],
                      quantity: 1,
                    );
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
                Container(
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
