import 'package:cloud_firestore/cloud_firestore.dart';

// TODO : Impliment Coin Updating Logic
var tempDocID;

class UpdateCoin {
  CollectionReference coins = FirebaseFirestore.instance.collection('coins');
  Future<void> findDoc({required String coinName}) {
    return coins.where("coin_name", isEqualTo: coinName).get().then(
          (QuerySnapshot snapshot) => {
            // driverPolylineCordinates.clear(),
            snapshot.docs.forEach((f) {
              tempDocID = f.reference.id;
              print("documentID---- " + f.reference.id);
            }),
          },
        );
  }

  Future<void> update({required String quantity, required var docID}) {
    CollectionReference users = FirebaseFirestore.instance.collection('coins');
    return users
        .doc("$tempDocID")
        .update({'quantity': "$quantity"})
        .then((value) => print("Coin quantity Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}
