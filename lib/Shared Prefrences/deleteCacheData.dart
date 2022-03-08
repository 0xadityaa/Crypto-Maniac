import 'package:shared_preferences/shared_preferences.dart';

class DeleteCacheData {
  Future deleteCache() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.clear();
    print("Data Delete from cache successful");
  }
}
