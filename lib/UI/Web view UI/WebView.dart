import 'package:crypto_meniac/UI/App%20UI/Home%20Page/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto Maniac News"),
        backgroundColor: Color(0XFF0B0D12),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: newsUrl,
      ),
    );
  }
}
