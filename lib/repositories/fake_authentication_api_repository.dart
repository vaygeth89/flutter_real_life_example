import 'package:flutter_example/interfaces/authentication_repository.dart';
import 'package:flutter_example/models/api_exception.dart';
import 'package:flutter_example/models/authentication_data.dart';

class FakeAuthenticationApiRepository implements AuthenticationRepository {
  final AuthenticationData _fakeAuthenticationData = AuthenticationData(
      accessToken: "fakeAccessToken",
      refreshToken: "fakeRefresh",
      name: "John Doe",
      expiresIn: 3600);
  @override
  Future<AuthenticationData> login(SignIn signIn) async {
    await Future.delayed(Duration(seconds: 2));
    if (signIn.email == "user@example.com" && signIn.password == "123456") {
      return _fakeAuthenticationData;
    }
    return throw ApiException("Invalid email or password");
  }

  @override
  Future<AuthenticationData> refresh(RefreshToken refreshToken) async {
    await Future.delayed(Duration(seconds: 2));
    return _fakeAuthenticationData;
  }
}
