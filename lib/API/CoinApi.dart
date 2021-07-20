import 'dart:convert';

import 'package:http/http.dart' as http;

var topCoinsData;

Future getTopCoins() async {
  final String url = "https://api.coingecko.com/api/v3/search/trending";
  final Uri uri = Uri.parse(url);
  final http.Response response = await http.get(uri, headers: {
    "Content-type": "application/json",
    "Accept": "application/body",
  });

  if (response.statusCode == 200) {
    final Map<String, dynamic> parsedData = json.decode(response.body);
    topCoinsData = parsedData['coins'][1]['item']['name'];
    print(topCoinsData);
  } else {
    print("ERROR in getTopCoins");
  }
}
