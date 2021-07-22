import 'package:crypto_meniac/API/CoinApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget createMarketPage({required TextEditingController searchController}) {
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
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        FontAwesomeIcons.search,
                        color: Colors.white,
                        size: 18.0,
                      ),
                      hintText: "Search a crypto",
                      hintStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
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
                      return Center(child: CircularProgressIndicator());
                    }
                    return ListView.builder(
                      itemCount: 245,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Container(
                            height: 90.0,
                            width: 355.0,
                            decoration: BoxDecoration(
                                color: Color(0XFF2F384A),
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      allCoinsData[index]['image']),
                                  // Image.network(
                                  // topCoinsData['coins'][index]['item']['small'],)),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      allCoinsData[index]['symbol'].toString(),
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.rupeeSign,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          " " +
                                              allCoinsData[index]
                                                      ['current_price']
                                                  .toStringAsFixed(5),
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
                                        Text(
                                          " " +
                                              allCoinsData[index][
                                                      'price_change_percentage_24h_in_currency']
                                                  .toStringAsFixed(2) +
                                              "%",
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
