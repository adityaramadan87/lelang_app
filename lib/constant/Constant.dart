import 'package:flutter/cupertino.dart';

class Constant {
  static Fonts fonts = Fonts();
  static Swatch swatch = Swatch();
  static Url url = Url();

}

class Url {
  const Url();
  String get BASE_URL => "http://192.168.42.47:8080/api";
  String get LOGIN => "/users/login";
}

class Pages {
  static const String WELCOME_SCREEN = "/welcome-screen";
  static const String LOGIN_SCREEN = "/login-screen";
  static const String REGISTER_SCREEN = "/register-screen";
}

class Fonts {
  const Fonts();
  String get POPPINS => "Poppins";
  String get NUNITO => "Nunito";
}

class Swatch {
  const Swatch();
  Color get PRIMARY => Color(0xFFE8505B);
}