import 'package:appinion_hrm/controller/AuthController.dart';
import 'package:appinion_hrm/repository/SharePreferanceData.dart';
import 'package:appinion_hrm/screen/common/Loader.dart';
import 'package:appinion_hrm/theme/Colors.dart';
import 'package:appinion_hrm/theme/ImageAssets.dart';
import 'package:appinion_hrm/theme/ImageConstant.dart';
import 'package:appinion_hrm/theme/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:appinion_hrm/repository/SharePreferanceData.dart';

import '../Home/HomeScreen.dart';
import 'component/AuthScreenComponent.dart';

String errorText = "";

class LoginScreen extends StatefulWidget {
  static const routeName = '/login_screen';



  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  var _passwordVisible = false;

  var userNameController = TextEditingController();
  var userPassController = TextEditingController();
  final loginController = Get.put(AuthController());



  void _togglePasswordVisible() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);


    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Expanded(
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                        purple,
                        lightBlue,
                      ])),
                  child: SafeArea(
                    child: Column(
                      children: [

                        const Expanded(flex: 2, child: SizedBox()),
                        authHeader(),
                        const Expanded(flex: 3, child: SizedBox()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 36),
                          child: TextFormField(
                              //  textAlign: TextAlign.center,
                              controller: userNameController,
                              decoration: const InputDecoration(
                                hintText: "user ID",
                                fillColor: Colors.white,
                                filled: true,
                                floatingLabelBehavior: FloatingLabelBehavior.always,
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 36),
                          child: TextFormField(
                              keyboardType: TextInputType.text,
                              obscureText: !_passwordVisible,
                              controller: userPassController,

                              //  textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  hintText: "password",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  fillColor: Colors.white,
                                  filled: true,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: gray,
                                    ),
                                    onPressed: () {
                                      _togglePasswordVisible();
                                    },
                                  ))),
                        ),

                        const SizedBox(
                          height: 24,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 36),
                          child: Container(
                            height: 48,
                            width: 156,
                            margin: const EdgeInsets.only(bottom: 16),
                            child: RaisedButton(
                              elevation: 5.0,
                              color: deepBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              onPressed: () {
                                if (!isValid(userNameController.text.toString(),
                                    userPassController.text.toString(), context)) {
                                  return;
                                }
                                loginController
                                    .authLogin(userNameController.text.toString(),
                                    userPassController.text.toString());
                                // Get.to(HomeScreen(),transition: Transition.rightToLeft,duration: Duration(seconds: 2));
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline),
                        ),
                        const SizedBox(
                          height: 24,
                        ),

                        const Expanded(flex: 5, child: SizedBox()),
                      ],
                    ),
                  ))),
          Obx(() {
            if (loginController.isLoading.value) {
              return Column(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height,
                      alignment: Alignment.center,
                      child: Center(child: Expanded(child: CircularLoading()))),
                ],
              );
            } else {
              return Text("");
            }
          }),
        ],
      ),
    ));
  }
}

final snackBar1 = SnackBar(content: Text(errorText));
final snackBar2 = SnackBar(content: Text(errorText));

bool isValid(String name, String pass, BuildContext context) {
  if (name == "" || pass == "") {
    errorText = "user name or password can't be empty";
    ScaffoldMessenger.of(context).showSnackBar(snackBar1);
    return false;
  }
  return true;
}
