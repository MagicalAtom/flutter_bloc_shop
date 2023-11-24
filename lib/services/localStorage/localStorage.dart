import 'package:flutter/foundation.dart';
import 'package:online_shop/di/di_shop.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage{
  static final ValueNotifier<String?> RemoveChangeNotifier = ValueNotifier(null); // هر وقت مقدارش تغییر کرد اعلام میکنه
  // بعد با چینج نوتیفایر بیلدر میفهمونه
  static final SharedPreferences _SharedPreferences = ServiceLocator.get();


  static set(key, value) {
    _SharedPreferences.setString(key, value);
    RemoveChangeNotifier.value = value; // اینجا هم با ولیو مقدارش رو تغییر میده
  }


   static get(key) {
    return _SharedPreferences.getString(key) ?? '';
  }

  static remove(key){
    _SharedPreferences.remove(key); // 
    RemoveChangeNotifier.value = null;
  }


  static has(key){
    String value = LocalStorage.get(key);
    return value.isNotEmpty;
  }






}
