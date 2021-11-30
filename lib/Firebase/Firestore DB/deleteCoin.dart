import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference coins = FirebaseFirestore.instance.collection('coins');

class DeleteCoin {
  Future<void> delete({required var docID}) {
    return coins
        .doc(docID)
        .delete()
        .then((value) => print("Coin Deleted"))
        .catchError((error) => print("Failed to delete coin: $error"));
  }
}
