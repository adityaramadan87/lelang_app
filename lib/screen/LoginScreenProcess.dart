import 'package:flutter/material.dart';
import 'package:lelang_app/api/resnreq/login/LoginRequest.dart';
import 'package:lelang_app/api/resnreq/login/LoginTask.dart';
import 'package:lelang_app/screen/LoginScreen.dart';

class LoginScreenProcess {

  LoginScreenProcess(this.lg);
  LoginScreenState lg;

  final form = GlobalKey<FormState>();

  TextEditingController passwordController;
  TextEditingController phoneController;
  LoginScreenProcess loginScreenProcess;
  bool isChanged;

  void init() {
    this.passwordController = new TextEditingController();
    this.phoneController = new TextEditingController();
    this.isChanged = false;
  }

  void dispose() {
    this.passwordController.dispose();
    this.phoneController.dispose();
  }

  void s(){
    if (this.form.currentState.validate()) {
      lg.setState(() {
        this.isChanged = !this.isChanged;

        LoginRequest loginRequest = new LoginRequest();
        loginRequest.phone = this.phoneController.text;
        loginRequest.password = this.passwordController.text;

        LoginTask loginTask = new LoginTask(returnedMain: lg);
        loginTask.fetch(loginRequest);
      });
    }
  }


  String phoneValidator(String value) {
    if (value.isEmpty){
      return "Phone number can't empty";
    }

    return null;
  }

  String passwordValidator(String value) {
    if (value.isEmpty && !(value.length > 6)) {
      return "Password must 6 characters or more";
    }

    if (value.contains(" ")){
      return "Password can't contains white space";
    }

    return null;
  }
}