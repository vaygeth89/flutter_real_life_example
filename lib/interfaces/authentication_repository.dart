import 'package:flutter_example/models/authentication_data.dart';

abstract class AuthenticationRepository {
  Future<AuthenticationData> login(SignIn body);
  Future<AuthenticationData> refresh(RefreshToken data);
}
