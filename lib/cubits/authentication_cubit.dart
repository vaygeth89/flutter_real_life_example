import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example/models/api_exception.dart';
import 'package:flutter_example/models/authentication_data.dart';
import 'package:flutter_example/interfaces/authentication_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthenticationRepository _authenticationService;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  AuthenticationCubit(this._authenticationService)
      : super(AuthenticationInitialState()) {
    authenticate();
  }

  Future authenticate() async {
    try {
      //?Note: Read the access token and refresh token from the device secure storage
      String? accessToken = await _secureStorage.read(key: "accessToken");
      String? refreshToken = await _secureStorage.read(key: "refreshToken");
      if (accessToken == null || refreshToken == null) {
        _unauthenticated();
        return;
      }

      //?Note: Refresh the access token
      final AuthenticationData authenticationData = await _authenticationService
          .refresh(RefreshToken(refreshToken: refreshToken));

      //?Note: Store the new access token and refresh token into device secure storage
      _saveTokens(authenticationData);

      //?Note: Emit the authenticated state
      emit(AuthenticatedState(
        authenticationData,
      ));
    } catch (e) {
      _unauthenticated();
    }
  }

  Future signIn(String email, String password) async {
    try {
      final signIn = SignIn(email: email, password: password);
      emit(AuthenticatingState(signIn: signIn));
      final result = await _authenticationService.login(signIn);
      _saveTokens(result);
      emit(AuthenticatedState(result));
    } on ApiException catch (e) {
      // throws when invalid credentials are provided
      emit(AuthenticationErrorState(e.message));
    } on Exception catch (e) {
      log(e.toString());
      _unauthenticated();
    }
  }

  void _saveTokens(AuthenticationData data) async {
    await _secureStorage.write(key: "accessToken", value: data.accessToken);
    await _secureStorage.write(key: "refreshToken", value: data.refreshToken);
  }

  void _unauthenticated() async {
    await _secureStorage.deleteAll();
    emit(UnauthenticatedState());
  }

  void signOut() {
    _unauthenticated();
  }
}

//!Note
abstract class AuthenticationState {
  const AuthenticationState();
}

class AuthenticationInitialState extends AuthenticationState {
  const AuthenticationInitialState();
}

class UnauthenticatedState<T> extends AuthenticationState {
  const UnauthenticatedState();
}

class AuthenticatingState extends AuthenticationState {
  final SignIn signIn;
  const AuthenticatingState({required this.signIn});
}

class AuthenticatedState extends AuthenticationState {
  final AuthenticationData data;
  const AuthenticatedState(this.data);
}

class AuthenticationErrorState extends AuthenticationState {
  final String message;
  const AuthenticationErrorState(this.message);
}
