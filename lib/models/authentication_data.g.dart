// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationData _$AuthenticationDataFromJson(Map<String, dynamic> json) =>
    AuthenticationData(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      name: json['name'] as String,
      expiresIn: (json['expiresIn'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AuthenticationDataToJson(AuthenticationData instance) =>
    <String, dynamic>{
      'expiresIn': instance.expiresIn,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'name': instance.name,
    };

RefreshToken _$RefreshTokenFromJson(Map<String, dynamic> json) => RefreshToken(
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$RefreshTokenToJson(RefreshToken instance) =>
    <String, dynamic>{
      'refreshToken': instance.refreshToken,
    };

SignIn _$SignInFromJson(Map<String, dynamic> json) => SignIn(
      email: json['email'] as String? ?? "",
      password: json['password'] as String? ?? "",
    );

Map<String, dynamic> _$SignInToJson(SignIn instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
