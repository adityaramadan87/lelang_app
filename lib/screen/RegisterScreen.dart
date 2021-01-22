import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'file:///F:/flutter_project/lelang_app/lib/screen/component/ButtonMain.dart';
import 'package:lelang_app/constant/Constant.dart';
import 'package:lelang_app/helper/SizeConfig.dart';
import 'package:lelang_app/screen/component/HeroContainer.dart';
import 'package:lelang_app/screen/component/InputFieldArea.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                          height: SizeConfig.blockSizeVertical * 30,
                          child: Image.asset('image/sign_up.png',),
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Register first, before start bid",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                  fontFamily: Constant.fonts.NUNITO,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical * 3,),
                            new InputFieldArea(
                              textInputType: TextInputType.text,
                              controller: new TextEditingController(),
                              hint: "Name",
                              obscure: false,
                              icon: Icons.person,
                              fillColor: Colors.white,
                              borderColor: Colors.black54,
                              focusBorderColor: Colors.black54,
                              textColor: Colors.black54,
                            ),
                            SizedBox(height: SizeConfig.blockSizeVertical * 2,),
                            new InputFieldArea(
                              textInputType: TextInputType.number,
                              controller: new TextEditingController(),
                              hint: "Phone",
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
                              controller: new TextEditingController(),
                              hint: "Password",
                              obscure: true,
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
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: ButtonMain(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    backgroundColor: Constant.swatch.PRIMARY,
                    width: SizeConfig.blockSizeHorizontal * 90,
                    text: "Register",
                    splashColor: Colors.grey.withOpacity(0.5),
                    textSize: 16,
                    textColor: Colors.white,
                    textWeight: FontWeight.bold,
                    heroTag: "register",
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
