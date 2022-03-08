import 'package:shared_preferences/shared_preferences.dart';

var networth = "";

class ReadCacheData {
  Future readCache({required String key}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    networth = sharedPreferences.get(key).toString();
    print("Data Read from cache successful");
    print("Net :" + networth);
  }
}
