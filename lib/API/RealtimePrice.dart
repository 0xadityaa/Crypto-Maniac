import 'dart:convert';
import 'package:http/http.dart' as http;

List<dynamic> realtimePrice = [];

Future getRealtimePrice({required dynamic coinId}) async {
  final String url =
      "https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&ids=$coinId&order=market_cap_desc&price_change_percentage=24h";
  final Uri uri = Uri.parse(url);
  final http.Response response = await http.get(uri, headers: {
    "Content-type": "application/json",
    "Accept": "application/body",
  });

  if (response.statusCode == 200) {
    var rawData = json.decode(response.body);
    // realtimePrice = rawData.data;
    //  realtimePrice[0]['current_price'];
    print("raw data: $rawData");
    return rawData[0];
  } else {
    print("ERROR in getRealtimePrice");
  }
}
