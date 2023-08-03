import 'package:firebase_database/firebase_database.dart';

class FireBaseServices {
  static FirebaseDatabase database = FirebaseDatabase.instance;

  static Future<void> setData(String path, dynamic value) async {
    String? uniqueKey = database.ref(path).push().key;
    DatabaseReference reference = database.ref("$path/$uniqueKey");
    await reference.set(value);
  }

  static Future<Map?> getData(String path) async {
    DatabaseReference reference = database.ref(path);
    DataSnapshot data = await reference.get();
    Map? userData = data.value == null ? null : data.value as Map;
    return userData;
  }
}
