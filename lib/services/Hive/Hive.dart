import 'package:hive_flutter/hive_flutter.dart';

class hive {
  static init() async {
    await Hive.initFlutter();
  }

  static run<T>(adapter) {
    Hive.registerAdapter<T>(adapter);
  }

  static make<T>(name) async {
    await Hive.openBox<T>(name);
  }

  static open<T>(name) {
    return Hive.box<T>(name);
  }


}
