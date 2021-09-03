import 'dart:convert';
import 'package:crypto_meniac/Firebase/Firestore%20DB/fetchData.dart';
import 'package:http/http.dart' as http;

var myCoins = new Map<String, dynamic>();

Future getMyCoins({required String coin}) async {
  final String url =
      "https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&ids=$coin&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=24h";
  final Uri uri = Uri.parse(url);
  final http.Response response = await http.get(uri, headers: {
    "Content-type": "application/json",
    "Accept": "application/body",
  });

  if (response.statusCode == 200) {
    final Map<String, dynamic> parsedData = json.decode(response.body);
    myCoins = parsedData;
    // ['coins'][1]['item']['price_btc'];
    print(myCoins[1]['id']);
  } else {
    print("ERROR in getTopCoins");
  }
}
