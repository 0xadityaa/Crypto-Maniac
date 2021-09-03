import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:crypto_meniac/Firebase/Auth/googleAuth.dart';

var myCoins = new Map<String, dynamic>();
String coin = "";

class FetchData {
  final user = FirebaseAuth.instance.currentUser!;
  Future getCoins() async {
    FirebaseFirestore.instance
        .collection('coins')
        .where('uid', isEqualTo: user.uid)
        .get()
        .then((QuerySnapshot snapshot) => {
              snapshot.docs.map((DocumentSnapshot documents) => {
                    myCoins = documents.data() as Map<String, dynamic>,
                  })
            });
    print(myCoins["buying_price"]);
  }
}
