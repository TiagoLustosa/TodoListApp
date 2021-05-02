import 'package:flutter/foundation.dart';

enum AuthMode { LOGIN, SIGN_UP }

class AuthDataModel {
  final String name;
  final String email;
  final String password;
  AuthMode _authMode = AuthMode.LOGIN;

  AuthDataModel({
    @required this.name,
    @required this.email,
    @required this.password,
  });

  bool get isSignUp {
    return _authMode == AuthMode.SIGN_UP;
  }

  bool get isLogin {
    return _authMode == AuthMode.LOGIN;
  }

  void toggleMode() {
    _authMode = _authMode == AuthMode.LOGIN ? AuthMode.SIGN_UP : AuthMode.LOGIN;
  }
}
