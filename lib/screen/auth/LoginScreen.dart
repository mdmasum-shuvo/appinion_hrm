import 'package:appinion_hrm/theme/Colors.dart';
import 'package:appinion_hrm/theme/ImageAssets.dart';
import 'package:appinion_hrm/theme/ImageConstant.dart';
import 'package:appinion_hrm/theme/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Home/HomeScreen.dart';
import 'component/AuthScreenComponent.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login_screen';

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  var _passwordVisible = false;

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
                  child: SizedBox(
                    height: getProportionateScreenHeight(48),
                    child: TextFormField(
                        //  textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                      hintText: "user ID",
                      fillColor: Colors.white,
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36),
                  child: SizedBox(
                    height: 48,
                    child: TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: !_passwordVisible,
                        //  textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintText: "password",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
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
                        Navigator.of(context)
                            .pushReplacementNamed(HomeScreen.routeName);
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
                const Expanded(flex: 5, child: SizedBox()),

              ],
            ),
          )),
    ));
  }
}
