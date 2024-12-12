import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  bool _isSaving = false;
  Future<void> saveSecureData(String key, String value) async {
    if (_isSaving) return;

    _isSaving = true;
    await _storage.write(key: key, value: value);
  }

  Future<String?> readSecureData(String key) async {
    // TODO: criar um modelo de erro
    try {
      final response = await _storage.read(key: key);
      return response;
    } catch (error) {
      return null;
    }
  }
}
