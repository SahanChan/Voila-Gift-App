import 'package:VoilaGiftApp/models/user.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on firebase user
  User _userFromFirebase(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
      // AuthResult result = await _auth.signInAnonymously();

    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email & password

  //register with email & password

  //sign out

}
