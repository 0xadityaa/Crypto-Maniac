import 'package:crypto_meniac/API/NewsApi.dart';
import 'package:crypto_meniac/UI/App%20UI/Home%20Page/HomePage.dart';
import 'package:crypto_meniac/UI/Web%20view%20UI/WebView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget createNewsPage({required BuildContext context}) {
  return Scaffold(
    backgroundColor: Color(0XFF0B0D12),
    body: Container(
      height: 1000.0,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
        future: getNewsData(),
        builder: (context, snapshot) {
          if (newsData.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: newsData['Data'].length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: GestureDetector(
                  onTap: () {
                    newsUrl = newsData['Data'][index]['url'];
                    print(newsUrl);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => WebViewPage()));
                  },
                  child: Container(
                    height: 140,
                    width: 355,
                    decoration: BoxDecoration(
                        color: Color(0XFF2F384A),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                newsData['Data'][index]['imageurl']),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  newsData['Data'][index]['title'],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  newsData['Data'][index]['categories'],
                                  overflow: TextOverflow.fade,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    ),
  );
}
