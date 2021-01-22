import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lelang_app/api/resnreq/login/LoginResponse.dart';
import 'package:lelang_app/api/resnreq/login/LoginTask.dart';
import 'file:///F:/flutter_project/lelang_app/lib/screen/component/ButtonMain.dart';
import 'package:lelang_app/constant/Constant.dart';
import 'package:lelang_app/helper/SizeConfig.dart';
import 'package:lelang_app/interface/ReturnedMain.dart';
import 'package:lelang_app/screen/LoginScreenProcess.dart';
import 'package:lelang_app/screen/component/HeroContainer.dart';
import 'package:lelang_app/screen/component/InputFieldArea.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> implements ReturnedMain {
  LoginScreenProcess process;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.process = new LoginScreenProcess(this);
    this.process.init();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    this.process.dispose();
  }

  @override
  void onSuccess(Object data, {flag}) {
    // TODO: implement onSuccess
    if (data is LoginResponse){
      LoginResponse logResponse = data;
      if (logResponse.requestCode == 0){
        print("SUCCESS");
      }else {
        setState(() {
          this.process.isChanged = !this.process.isChanged;
        });
      }
    }
  }

  @override
  void onError(String message) {
    // TODO: implement onError
    setState(() {
      this.process.isChanged = !this.process.isChanged;
    });
    print(message);
  }

  @override
  bool onProgress(bool isLoading) {
    print(isLoading);
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0;
    SizeConfig().init(context);
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Constant.swatch.PRIMARY,
                              size: 24,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }
                        ),
                        HeroContainer(
                          heroTag: "pict",
                          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                          width: SizeConfig.screenWidth,
                          height: SizeConfig.blockSizeVertical * 40,
                          child: Image.asset('image/sign_in.png',),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical * 2,),
                    Card(
                      elevation: 6,
                      color: Colors.white,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        width: SizeConfig.blockSizeHorizontal * 90,
                        child: Form(
                          key: this.process.form,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Login your account",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 20,
                                    fontFamily: Constant.fonts.NUNITO,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(height: SizeConfig.blockSizeVertical * 3,),
                              new InputFieldArea(
                                textInputType: TextInputType.number,
                                controller: this.process.phoneController,
                                hint: "Phone",
                                validator: this.process.phoneValidator,
                                obscure: false,
                                icon: Icons.phone,
                                fillColor: Colors.white,
                                borderColor: Colors.black54,
                                focusBorderColor: Colors.black54,
                                textColor: Colors.black54,
                              ),
                              SizedBox(height: SizeConfig.blockSizeVertical * 2,),
                              new InputFieldArea(
                                textInputType: TextInputType.text,
                                controller: this.process.passwordController,
                                hint: "Password",
                                obscure: true,
                                validator: this.process.passwordValidator,
                                icon: Icons.lock,
                                fillColor: Colors.white,
                                borderColor: Colors.black54,
                                focusBorderColor: Colors.black54,
                                textColor: Colors.black54,
                              ),
                              SizedBox(height: SizeConfig.blockSizeVertical * 3,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: this.process.isChanged ? SizeConfig.blockSizeHorizontal * 20 : SizeConfig.blockSizeHorizontal * 90,
                    child: ButtonMain(
                      onTap: () {
                        if (!this.process.isChanged) {
                          this.process.s();
                        }
                      },
                      borderRadius: BorderRadius.circular(this.process.isChanged ? 55 : 16),
                      isLoading: this.process.isChanged,
                      backgroundColor: Constant.swatch.PRIMARY,
                      width: SizeConfig.blockSizeHorizontal * 90,
                      text: "Login",
                      splashColor: Colors.grey.withOpacity(0.5),
                      textSize: 16,
                      textColor: Colors.white,
                      textWeight: FontWeight.bold,
                      heroTag: "login",
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
