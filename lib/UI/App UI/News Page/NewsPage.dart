import 'package:crypto_meniac/UI/App%20UI/News%20Page/NewsPage_widgets.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return createNewsPage(context: context);
  }
}
