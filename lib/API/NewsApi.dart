import 'dart:convert';

import 'package:http/http.dart' as http;

var newsData = new Map<String, dynamic>();

Future getNewsData() async {
  final String url = "https://min-api.cryptocompare.com/data/v2/news/?lang=EN";
  final Uri uri = Uri.parse(url);
  final http.Response response = await http.get(uri, headers: {
    "Content-type": "application/json",
    "Accept": "application/body",
  });

  if (response.statusCode == 200) {
    final Map<String, dynamic> parsedData = json.decode(response.body);
    newsData = parsedData;
    print(newsData['Data'][1]['title']);
    // ['data'][1]['title'];
  } else {
    print("ERROR in getNewsData");
  }
}
