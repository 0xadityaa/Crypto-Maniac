import 'package:flutter/material.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({ Key? key }) : super(key: key);

  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Market Page"),
      )
    );
  }
}