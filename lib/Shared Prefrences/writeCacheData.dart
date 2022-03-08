import 'package:shared_preferences/shared_preferences.dart';

// REMEMBER: This contains data like :
// totalInvested --Total amt invested
// netWorth -- Current value of invested amount
// overallGain -- Overall profit made through all investment combined
// dailyGain -- Daily profit made through all investment combined
// transactionHistory -- Transaction history of user
// date -- Date of the transaction made

class WriteCache {
  Future writeCache({required String key, required String value}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString(key, value);
    print("Data Written to cache");
  }
}
