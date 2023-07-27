// ignore_for_file: constant_identifier_names

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {}

const String AUTH_TOKEN = 'AUTH_TOKEN';

class LocalSecureStorage {
  static const _storage = FlutterSecureStorage();

  static write({required String value, required String key}) async {
    await _storage.write(key: key, value: value);
  }

  static Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  static void delete() async {
    return await _storage.deleteAll();
  }
}
