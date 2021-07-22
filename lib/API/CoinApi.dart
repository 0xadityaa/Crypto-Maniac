import 'dart:convert';

import 'package:http/http.dart' as http;

var topCoinsData = new Map<String, dynamic>();
List<dynamic> allCoinsData = [];
String currency = 'inr';

Future getTopCoins() async {
  final String url = "https://api.coingecko.com/api/v3/search/trending";
  final Uri uri = Uri.parse(url);
  final http.Response response = await http.get(uri, headers: {
    "Content-type": "application/json",
    "Accept": "application/body",
  });

  if (response.statusCode == 200) {
    final Map<String, dynamic> parsedData = json.decode(response.body);
    topCoinsData = parsedData;
    // ['coins'][1]['item']['price_btc'];
  } else {
    print("ERROR in getTopCoins");
  }
}

Future getAllCoins() async {
  final String url =
      "https://api.coingecko.com/api/v3/coins/markets?vs_currency=$currency&order=market_cap_desc&per_page=1000&page=1&sparkline=false&price_change_percentage=24h";
  final Uri uri = Uri.parse(url);
  final http.Response response = await http.get(uri, headers: {
    "Content-type": "application/json",
    "Accept": "application/body",
  });

  if (response.statusCode == 200) {
    final List<dynamic> parsedData = json.decode(response.body);
    allCoinsData = parsedData;
    // [1]['id'];
  } else {
    print("ERROR in getAllCoins");
  }
}
