import 'package:flutter_example/models/authentication_data.dart';

enum StoredKeys {
  accessToken,
  refreshToken,
  accessTokenExpiry,
  ;

  const StoredKeys();
  String get description => name;
}

abstract class SecureStorageService {
  Future<AuthenticationData> getStoredAuthenticationData();
  Future<AuthenticationData> storeAuthenticationData(
      AuthenticationData authenticationData);
  Future<void> deleteStoredTokens();
  Future<String> get accessToken;
  Future<String> get refreshToken;
  Future initSavedKeys();
}
