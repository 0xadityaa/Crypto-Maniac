import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto_meniac/UI/App%20UI/Coin%20Detail%20Page/CoinDetail.dart';

// TODO : Impliment Coin Updating Logic

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
    return coins
        .doc("$tempDocID")
        .update({'quantity': "$quantity"})
        .then((value) => print("Coin quantity Updated"))
        .catchError((error) => print("Failed to update Coin: $error"));
  }
}
