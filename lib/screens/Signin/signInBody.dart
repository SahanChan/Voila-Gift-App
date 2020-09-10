import 'package:VoilaGiftApp/services/auth.dart';
import 'package:flutter/material.dart';

class SignInBody extends StatefulWidget {
  @override
  _SignInBodyState createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      child: RaisedButton(
        child: Text('Sign in anonymously'),
        onPressed: () async {
          dynamic result = await _auth.signInAnon();
          if (result == null) {
            print("Error Signin in");
          } else {
            print(result.uid);
          }
        },
      ),
    );
  }
}
