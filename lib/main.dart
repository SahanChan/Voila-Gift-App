import 'package:VoilaGiftApp/models/user.dart';
import 'package:VoilaGiftApp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'screens/wrapper.dart';

void main() {
  runApp(VoilaApp());
}

class VoilaApp extends StatefulWidget {
  @override
  _VoilaAppState createState() => _VoilaAppState();
}

class _VoilaAppState extends State<VoilaApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Wrapper(),
        ));
  }
}
