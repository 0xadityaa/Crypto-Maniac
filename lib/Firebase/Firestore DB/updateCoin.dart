import 'package:cloud_firestore/cloud_firestore.dart';

// TODO : Impliment Coin Updating Logic
class UpdateCoin {
  CollectionReference coins = FirebaseFirestore.instance.collection('coins');
  Future<void> updateUser() {
    return coins
        .doc('ABC123')
        .update({'company': 'Stokes and Sons'})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}
