import 'package:flutter/material.dart';

Widget createOnboardingPage({
  required String path,
  required String titleText,
  required String bodyText,
  required Widget nextPage,
  required Widget skipPage,
  required BuildContext context,
  required Color colorDot1,
  required Color colorDot2,
  required Color colorDot3,
  required Color colorDot4,
  required bool finalBtn,
}) {
  return Scaffold(
    body: Container(
      color: Colors.blue[300],
      // Color(0XFFF2F2F2),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 23.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => skipPage));
                },
                child: Text("Skip",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0)),
              ),
              SizedBox(
                width: 5.0,
              ),
            ]),
            Image.asset(path),
            SizedBox(
              height: 8.0,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 4.0,
                        backgroundColor: colorDot1,
                        // Color(0XFF347AF0)
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      CircleAvatar(
                        radius: 4.0,
                        backgroundColor: colorDot2,
                        // Color(0XFFEDF1F9)
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      CircleAvatar(
                        radius: 4.0,
                        backgroundColor: colorDot3,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      CircleAvatar(
                        radius: 4.0,
                        backgroundColor: colorDot4,
                      ),
                    ],
                  ),
                  Text(titleText,
                      style: TextStyle(
                          fontSize: 36.0, fontWeight: FontWeight.bold)),
                  Text(bodyText,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w500)),
                  finalBtn
                      ? GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => nextPage));
                          },
                          child: Container(
                            height: 48.0,
                            width: 279.0,
                            decoration: BoxDecoration(
                              color: Color(0XFF347AF0),
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(color: Color(0XFF347AF0)),
                            ),
                            child: Center(
                              child: Text(
                                "Go to app",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 19.0),
                              ),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => nextPage));
                          },
                          child: Container(
                            height: 48.0,
                            width: 279.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(color: Color(0XFF347AF0)),
                            ),
                            child: Center(
                              child: Text(
                                "Next Step",
                                style: TextStyle(
                                    color: Color(0XFF347AF0), fontSize: 19.0),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
