import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({ Key? key }) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("News Page"),
      )
    );
  }
}