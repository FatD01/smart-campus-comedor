import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  // Configuración para Android (necesaria para que el cifrado funcione bien)
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  final _storage = const FlutterSecureStorage();

  // Guardar el Token
  Future<void> saveToken(String token) async {
    await _storage.write(
      key: 'auth_token', 
      value: token, 
      aOptions: _getAndroidOptions(),
    );
  }

  // Leer el Token
  Future<String?> getToken() async {
    return await _storage.read(
      key: 'auth_token', 
      aOptions: _getAndroidOptions(),
    );
  }

  // Borrar todo (Logout)
  Future<void> clearAuthData() async {
    await _storage.delete(key: 'auth_token', aOptions: _getAndroidOptions());
  }
}