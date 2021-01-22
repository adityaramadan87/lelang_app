import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lelang_app/constant/Constant.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(),
    );
  }

  start() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, _navPage);
  }

  void _navPage() {
    Navigator.pushReplacementNamed(context, Pages.WELCOME_SCREEN);
  }
}
