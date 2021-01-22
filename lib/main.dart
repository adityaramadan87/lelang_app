import 'package:flutter/material.dart';
import 'package:lelang_app/constant/Constant.dart';
import 'package:lelang_app/route/Nav.dart';
import 'package:lelang_app/screen/LoginScreen.dart';
import 'package:lelang_app/screen/RegisterScreen.dart';
import 'package:lelang_app/screen/SplashScreen.dart';
import 'package:lelang_app/screen/WelcomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lelang',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: Constant.fonts.POPPINS
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // ignore: missing_return
      onGenerateRoute: (RouteSettings settings) {
        final args = settings.arguments;

        switch (settings.name) {
          case Pages.WELCOME_SCREEN:
            return Nav(
              builder: (_) => WelcomeScreen(),
              settings: settings,
              fadeTs: true
            );
          case Pages.LOGIN_SCREEN:
            return Nav(
              builder: (_) => LoginScreen(),
              settings: settings,
              fadeTs: true
            );
          case Pages.REGISTER_SCREEN:
            return Nav(
                builder: (_) => RegisterScreen(),
                settings: settings,
                fadeTs: true
            );
        }
      },
    );
  }
}
