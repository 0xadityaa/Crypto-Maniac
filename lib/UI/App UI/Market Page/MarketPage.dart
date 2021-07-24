import 'package:crypto_meniac/API/CoinApi.dart';
import 'package:crypto_meniac/UI/App%20UI/Market%20Page/MarketPage_widgets.dart';
import 'package:flutter/material.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({Key? key}) : super(key: key);

  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF0B0D12),
      body: createMarketPage(
        searchController: searchController,
      ),
    );
  }
}
