import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_meniac/API/CoinApi.dart';
import 'package:crypto_meniac/Firebase/Firestore%20DB/fetchData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

List<String> coinId = [];
int i = 0;
Widget createPortfolioPage() {
  return Scaffold(
    backgroundColor: Color(0XFF0B0D12),
    body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.0),
          Text(
            "My Portfolio",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: Container(
              height: 220.0,
              width: 360.0,
              decoration: BoxDecoration(
                  color: Color(0XFF2F384A),
                  borderRadius: BorderRadius.circular(20.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Net worth",
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
                    "₹ " + "75000",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: Container(
                      width: 330.0,
                      height: 3.0,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Overall ",
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Image.asset("assets/icons/upRightArrow.png"),
                              Text(
                                " 12.0" + "%",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ],
                          ),
                          Text(
                            "₹ " + "25000",
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Center(
                        child: Container(
                          height: 90.0,
                          width: 3.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Today ",
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Image.asset("assets/icons/upRightArrow.png"),
                              Text(
                                " 1.8" + "%",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ],
                          ),
                          Text(
                            "₹ " + "1500",
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Text(
            "My Coins",
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
            height: 360.0,
            child: StreamBuilder<QuerySnapshot>(
                // <2> Pass `Stream<QuerySnapshot>` to stream
                stream:
                    FirebaseFirestore.instance.collection('coins').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // <3> Retrieve `List<DocumentSnapshot>` from snapshot
                    final List<DocumentSnapshot> documents =
                        snapshot.data!.docs;
                    documents.map((e) => coinId += e['coin_name']);
                    return ListView(
                      children: documents
                          .map(
                            (doc) => Container(
                                child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(doc['img_url']),
                                ),
                                Column(
                                  children: [
                                    Text(doc['coin_name'],
                                        style: TextStyle(color: Colors.white)),
                                    Text(doc['coin_id'],
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                                Text(doc['quantity'].toString(),
                                    style: TextStyle(color: Colors.white)),
                                // Text(),
                              ],
                            )),
                          )
                          .toList(),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Its Error');
                  }
                  return Center(
                    child:
                        Lottie.asset("assets/animations/LoadingAnimation.json"),
                  );
                }),
          ),
          // MaterialButton(
          //     onPressed: () {
          //       FetchData().getCoins();
          //     },
          //     child: Text("Press"),
          //     color: Colors.blue)
        ],
      ),
    ),
  );
}
