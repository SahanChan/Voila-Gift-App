import 'package:VoilaGiftApp/appBars/signInAppBar.dart';
import 'package:VoilaGiftApp/colors.dart';
import 'package:VoilaGiftApp/screens/Signin/signInBody.dart';
import 'package:VoilaGiftApp/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: SignInAppBar(title: "Sign in"),
      body: SignInBody(),
    );
  }
}
