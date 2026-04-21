import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecurePreferenceManager {
  static const _storage = FlutterSecureStorage();

  static Future<void> saveData(String key, dynamic value) async {
    await _storage.write(
      key: key,
      value: value.toString(),
      aOptions: const AndroidOptions(encryptedSharedPreferences: true),
    );
  }

  static Future<dynamic> getData(String key, {Type? type}) async {
    String? value = await _storage.read(
      key: key,
      aOptions: const AndroidOptions(encryptedSharedPreferences: true),
    );
    if (value == null) return null;

    if (type == int) return int.tryParse(value);
    if (type == double) return double.tryParse(value);
    if (type == bool) return value == "true";
    return value; // default string
  }

  static Future<void> removeData(String key) async {
    await _storage.delete(key: key);
  }

  static Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}

// await SecurePreferenceManager.saveData(AppStrings.deviceId, _deviceId);
// SecurePreferenceManager.saveData("isLogin", true);
//
//String? DeviceID = await SecurePreferenceManager.getData(AppStrings.deviceId);
// bool? isLogin = await SecurePreferenceManager.getData("isLogin", type: bool);
