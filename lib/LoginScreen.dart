import 'package:appinion_hrm/theme/Colors.dart';
import 'package:appinion_hrm/theme/ImageConstant.dart';
import 'package:appinion_hrm/theme/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topRight, colors: [
              red,
              purple,
            ])),
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Image.asset("assets/images/app_icon.png"),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Human Resource Mangement",
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                        decoration: const InputDecoration(
                      hintText: "Password",
                      fillColor: Colors.white,
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    )),
                  ),
                ],
              ),
            )));
  }
}
