import 'package:VoilaGiftApp/appBars/signInAppBar.dart';
import 'package:VoilaGiftApp/constants.dart';
import 'package:VoilaGiftApp/loading.dart';
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

  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: BackgroundColor,
            appBar: SignInAppBar(
              title: "Register",
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Image(
                                image: AssetImage('assets/images/logo.png'),
                                width: 200,
                                height: 200,
                              ),
                              Text(
                                "Register",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "with voila",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration:
                            inputDecoration.copyWith(hintText: "Email Address"),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration:
                            inputDecoration.copyWith(hintText: "Password"),
                        validator: (val) => val.length < 6
                            ? 'Please enter a password greater than 6'
                            : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                            color: PrimaryColor,
                            child: Text("Register"),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  loading = true;
                                });
                                dynamic result =
                                    await _auth.registerWithEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() {
                                    loading = false;
                                    error = 'please supply a valid email';
                                  });
                                }
                              }
                            },
                          ),
                          SizedBox(width: 10.0),
                          RaisedButton(
                            onPressed: () {
                              widget.toggleView();
                            },
                            child: Text("Sign In"),
                            color: PrimaryColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      RaisedButton(
                        child: Text("Continue Anonymously",
                            style: TextStyle(color: PrimaryColor)),
                        color: Colors.black,
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });
                          dynamic result = await _auth.signInAnon();
                          if (result == null) {
                            print("Error Signin in");
                          } else {
                            print(result.uid);
                          }
                        },
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
