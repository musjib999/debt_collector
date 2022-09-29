import 'package:shared_preferences/shared_preferences.dart';

class LocalData{
  Future<bool> addListToSharedPreference({required String key, required List<String> value}) async{
    final store = await SharedPreferences.getInstance();
    bool hasAdded =  await store.setStringList(key, value);
    return hasAdded;
  }

  Future<List<String>?> getListFromSharedPreference({required String key}) async{
    final store = await SharedPreferences.getInstance();
    return store.getStringList(key);
  }
}

LocalData localData = LocalData();