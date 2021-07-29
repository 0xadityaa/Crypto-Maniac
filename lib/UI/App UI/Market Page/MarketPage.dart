import 'package:crypto_meniac/API/CoinApi.dart';
import 'package:crypto_meniac/UI/App%20UI/Coin%20Detail%20UI/CoinDetail.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

String graphUrl = "";
String selectedCoinId = "";

class MarketPage extends StatefulWidget {
  const MarketPage({Key? key}) : super(key: key);

  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: Color(0XFF0B0D12),
    //   body: createMarketPage(
    //     searchController: searchController,
    //   ),
    // );
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: Container(
                  height: 55.0,
                  width: 355.0,
                  decoration: BoxDecoration(
                      color: Color(0XFF96839D),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Center(
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          FontAwesomeIcons.search,
                          color: Colors.white,
                          size: 18.0,
                        ),
                        hintText: "Search a crypto",
                        // style: TextSt
                        hintStyle: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      // onChanged: searchCrypto,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 660.0,
                  child: FutureBuilder(
                    future: getAllCoins(),
                    builder: (context, snapshot) {
                      if (allCoinsData.isEmpty) {
                        return Center(
                            child: Lottie.asset(
                                "assets/animations/LoadingAnimation.json"));
                      }
                      return ListView.builder(
                        itemCount: allCoinsData.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                  selectedCoinId =
                                      allCoinsData[index]['symbol'];
                                  selectedCoinId.toUpperCase();
                                  graphUrl =
                                      "https://in.tradingview.com/chart/?symbol=$selectedCoinId" +
                                          "USD";
                                });
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CoinDetail()));
                              },
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
                                          allCoinsData[index]['image']),
                                      // Image.network(
                                      // topCoinsData['coins'][index]['item']['small'],)),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 100.0,
                                          child: Expanded(
                                            child: Text(
                                              allCoinsData[index]['name'],
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          allCoinsData[index]['symbol']
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            currency == 'inr'
                                                ? Icon(
                                                    FontAwesomeIcons.rupeeSign,
                                                    color: Colors.white,
                                                  )
                                                : Icon(
                                                    FontAwesomeIcons.dollarSign,
                                                    color: Colors.white,
                                                  ),
                                            Text(
                                              " " +
                                                  allCoinsData[index]
                                                          ['current_price']
                                                      .toStringAsFixed(2),
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
                                            allCoinsData[index][
                                                        'price_change_percentage_24h_in_currency'] >
                                                    0
                                                ? Image.asset(
                                                    "assets/icons/upRightArrow.png")
                                                : Image.asset(
                                                    "assets/icons/downRightArrow.png"),
                                            // Text(
                                            //   " " +
                                            //       allCoinsData[index][
                                            //               'price_change_percentage_24h_in_currency']
                                            //           .toStringAsFixed(2) +
                                            //       "%",
                                            //   style: TextStyle(
                                            //       fontSize: 15.0,
                                            //       fontWeight: FontWeight.bold,
                                            //       color: Colors.green),
                                            // )
                                            allCoinsData[index][
                                                        'price_change_percentage_24h_in_currency'] >
                                                    0
                                                ? Text(
                                                    " " +
                                                        allCoinsData[index][
                                                                'price_change_percentage_24h_in_currency']
                                                            .toStringAsFixed(
                                                                2) +
                                                        "%",
                                                    style: TextStyle(
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.green),
                                                  )
                                                : Text(
                                                    " " +
                                                        allCoinsData[index][
                                                                'price_change_percentage_24h_in_currency']
                                                            .toStringAsFixed(
                                                                2) +
                                                        "%",
                                                    style: TextStyle(
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.red),
                                                  ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}