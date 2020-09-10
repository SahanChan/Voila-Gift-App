import 'package:VoilaGiftApp/appBars/signInAppBar.dart';
import 'package:VoilaGiftApp/colors.dart';
// import 'package:VoilaGiftApp/screens/Register/registerBody.dart';
// import 'package:VoilaGiftApp/screens/Signin/signInBody.dart';
import 'package:VoilaGiftApp/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: SignInAppBar(
        title: "Register",
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "to voila",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: PrimaryColor,
                child: Text("Register"),
                onPressed: () async {
                  print(email);
                  print(password);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                onPressed: () {
                  widget.toggleView();
                },
                child: Text("Sign In"),
                color: PrimaryColor,
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                child: Text("Continue Anonymously"),
                color: PrimaryColor,
                onPressed: () async {
                  dynamic result = await _auth.signInAnon();
                  if (result == null) {
                    print("Error Signin in");
                  } else {
                    print(result.uid);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
