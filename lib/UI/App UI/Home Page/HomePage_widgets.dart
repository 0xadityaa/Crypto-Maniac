import 'package:crypto_meniac/API/CoinApi.dart';
import 'package:crypto_meniac/API/NewsApi.dart';
import 'package:crypto_meniac/UI/App%20UI/Home%20Page/HomePage.dart';
import 'package:crypto_meniac/UI/Web%20view%20UI/WebView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget createHomePage({required BuildContext context}) {
  return Container(
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Dashboard",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 90,
                  width: 172,
                  decoration: BoxDecoration(
                    color: Color(0XFF96839D),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Net Worth",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 3.0,
                        ),
                        Center(
                            child: Text(
                          "₹ " + "75000",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 90,
                  width: 172,
                  decoration: BoxDecoration(
                    color: Color(0XFF96839D),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Today",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400),
                            ),
                            Row(
                              children: [
                                Image.asset("assets/icons/upRightArrow.png"),
                                Text(
                                  " 1.5 " + "%",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3.0,
                        ),
                        Center(
                            child: Text(
                          "₹ " + "2500",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Top Coins",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 320.0,
              child: FutureBuilder(
                  future: getTopCoins(),
                  builder: (context, snapshot) {
                    if (topCoinsData.isEmpty) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                        itemCount: topCoinsData['coins'].length,
                        physics: AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        // shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              height: 90.0,
                              width: 355.0,
                              decoration: BoxDecoration(
                                  color: Color(0XFF2F384A),
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        topCoinsData['coins'][index]['item']
                                            ['small']),
                                    // Image.network(
                                    // topCoinsData['coins'][index]['item']['small'],)),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        topCoinsData['coins'][index]['item']
                                            ['name'],
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        topCoinsData['coins'][index]['item']
                                            ['symbol'],
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.bitcoin,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "  " +
                                                topCoinsData['coins'][index]
                                                        ['item']['price_btc']
                                                    .toStringAsFixed(6),
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                              "assets/icons/upRightArrow.png"),
                                          Text(
                                            " 12.6" + "%",
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  }),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Crypto News",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 120.0,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: getNewsData(),
                builder: (context, snapshot) {
                  if (newsData.isEmpty) {
                    return CircularProgressIndicator();
                  }
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            newsUrl = newsData['Data'][index]['url'];
                            print(newsUrl);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => WebViewPage()));
                          },
                          child: Container(
                            height: 100,
                            width: 355,
                            decoration: BoxDecoration(
                                color: Color(0XFF2F384A),
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        newsData['Data'][index]['imageurl']),
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      newsData['Data'][index]['title'] + "...",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
