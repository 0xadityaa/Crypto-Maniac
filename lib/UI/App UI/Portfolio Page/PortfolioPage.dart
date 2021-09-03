import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_meniac/API/RealtimePrice.dart';
import 'package:crypto_meniac/UI/App%20UI/Portfolio%20Page/PortfolioPage_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

String coinId = "";
int i = 0;

// TODO : implemented a minor logic for solving index error testing on device is left
class PortfolioPage extends StatefulWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final Stream<QuerySnapshot> coins =
      FirebaseFirestore.instance.collection('coins').snapshots();
  @override
  Widget build(BuildContext context) {
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
              height: 360,
              child: StreamBuilder<QuerySnapshot>(
                stream: coins,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot,
                ) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Lottie.asset(
                          'assets/animations/LoadingAnimation.json'),
                    );
                  }
                  final data = snapshot.requireData;
                  print("Index size : ${snapshot.data?.size.toString()}");
                  return ListView.builder(
                    itemCount: snapshot.data?.size ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      // setState(() {
                      //   coinId = data.docs[index]['coin_id'];
                      // });
                      // print(data.size);
                      // i++;

                      return FutureBuilder(
                          future: getRealtimePrice(
                              coinId: data.docs[index]['coin_id']),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var responseFormAPI;
                              responseFormAPI = snapshot.data;
                              print(responseFormAPI['current_price']);
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                            data.docs[index]['img_url']),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(data.docs[index]['coin_name'],
                                              style:
                                                  TextStyle(color: Colors.white)),
                                          Text(data.docs[index]['coin_id'],
                                              style:
                                                  TextStyle(color: Colors.white)),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              "₹ " +
                                                  responseFormAPI['current_price']
                                                      .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0)),
                                          responseFormAPI[
                                                      'price_change_percentage_24h'] >
                                                  0
                                              ? Row(
                                                  children: [
                                                    Image.asset(
                                                        "assets/icons/upRightArrow.png"),
                                                    Text(
                                                        responseFormAPI[
                                                                    'price_change_percentage_24h']
                                                                .toStringAsFixed(
                                                                    2) +
                                                            " %",
                                                        style: TextStyle(
                                                            color: Colors.green,
                                                            fontSize: 15.0)),
                                                  ],
                                                )
                                              : Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Image.asset(
                                                        "assets/icons/downRightArrow.png"),
                                                    Text(
                                                        responseFormAPI[
                                                                    'price_change_percentage_24h']
                                                                .toStringAsFixed(
                                                                    2) +
                                                            " %",
                                                        style: TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 15.0)),
                                                  ],
                                                ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return Center(
                                child: Lottie.asset(
                                    'assets/animations/LoadingAnimation.json'),
                              );
                            }
                          });
                    },
                  );
                },
              ),
              //   child: StreamBuilder<QuerySnapshot>(
              //       // <2> Pass `Stream<QuerySnapshot>` to stream
              //       stream: FirebaseFirestore.instance
              //           .collection('coins')
              //           .snapshots(),
              //       builder: (context, snapshot) {
              //         if (snapshot.hasData) {
              //           // <3> Retrieve `List<DocumentSnapshot>` from snapshot
              //           final List<DocumentSnapshot> documents =
              //               snapshot.data!.docs;
              //           documents.map((e) {
              //             setState(() {
              //               coinId = e['coin_name'];
              //             });
              //           });
              //           //2 min ho bro
              //           // ok np
              //           print("Coin Name : $coinId");
              //           List responseData = [];
              //           getRealtimePrice(coinId: coinId).then((response) {
              //             responseData.add(response);
              //           });
              //           print("response data is : ${responseData.toString()}");
              //           return ListView(
              //             children: documents
              //                 .map(
              //                   (doc) => Container(
              //                       child: Row(
              //                     children: [
              //                       CircleAvatar(
              //                         backgroundImage:
              //                             NetworkImage(doc['img_url']),
              //                       ),
              //                       Column(
              //                         children: [
              //                           Text(doc['coin_name'],
              //                               style:
              //                                   TextStyle(color: Colors.white)),
              //                           Text(doc['coin_id'],
              //                               style:
              //                                   TextStyle(color: Colors.white)),
              //                         ],
              //                       ),
              //                       Text(doc['quantity'].toString(),
              //                           style: TextStyle(color: Colors.white)),
              //                     ],
              //                   )),
              //                 )
              //                 .toList(),
              //           );
              //         } else if (snapshot.hasError) {
              //           return Text('Its Error');
              //         }
              //         return Center(
              //           child: Lottie.asset(
              //               "assets/animations/LoadingAnimation.json"),
              //         );
              //       }),
              // ),
              // MaterialButton(
              //     onPressed: () {
              //       getRealtimePrice(coinId: 'bitcoin');
              //     },
              //     child: Text("Press"),
              //     color: Colors.blue)
            )
          ],
        ),
      ),
    );
  }
}
