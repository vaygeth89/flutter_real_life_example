import 'package:json_annotation/json_annotation.dart';

part 'authentication_data.g.dart';

@JsonSerializable()
class AuthenticationData {
  final int? expiresIn;
  final String accessToken;
  final String refreshToken;
  final String name;
  AuthenticationData({
    required this.accessToken,
    required this.refreshToken,
    required this.name,
    this.expiresIn,
  });

  @override
  Map<String, dynamic> toJson() => _$AuthenticationDataToJson(this);

  factory AuthenticationData.fromJson(Map<String, dynamic> map) =>
      _$AuthenticationDataFromJson(map);
}

@JsonSerializable()
class RefreshToken {
  final String refreshToken;
  RefreshToken({required this.refreshToken});
  Map<String, dynamic> toJson() => _$RefreshTokenToJson(this);

  factory RefreshToken.fromJson(Map<String, dynamic> map) =>
      _$RefreshTokenFromJson(map);
}

@JsonSerializable()
class SignIn {
  final String email;
  final String password;
  const SignIn({
    this.email = "",
    this.password = "",
  });

  Map<String, dynamic> toJson() => _$SignInToJson(this);

  factory SignIn.fromJson(Map<String, Object?> json) => _$SignInFromJson(json);
}
