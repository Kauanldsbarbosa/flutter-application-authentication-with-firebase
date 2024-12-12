import 'package:authenticate/services/secure_storage_service.dart';
import 'package:flutter/material.dart';

class Auth with ChangeNotifier {
  String? _token; // ignore: unused_field

  Future<bool> get isAuthenticated async {
    final tokenExpirationDate =
        await SecureStorageService().readSecureData('token-expires-date');

    if (tokenExpirationDate == null) return false;

    try {
      final isValid =
          DateTime.parse(tokenExpirationDate).isAfter(DateTime.now());

      final token = await SecureStorageService().readSecureData('auth-token');
      return token != null && isValid;
    } catch (_) {
      return false;
    }
  }

  Auth() {
    _initializeToken();
  }

  Future<void> _initializeToken() async {
    final token = await SecureStorageService().readSecureData('auth-token');
    if (token != null && token != 'No data found.') {
      _token = token;
    }
  }
}
