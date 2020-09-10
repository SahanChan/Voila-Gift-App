import 'package:VoilaGiftApp/models/user.dart';
import 'package:VoilaGiftApp/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Home/Home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user != null) {
      return Home();
    } else {
      return Authenticate();
    }
  }
}
