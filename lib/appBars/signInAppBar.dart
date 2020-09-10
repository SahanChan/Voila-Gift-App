import 'package:flutter/material.dart';
import 'package:VoilaGiftApp/colors.dart';
// import '../colors.dart';

class SignInAppBar extends StatefulWidget implements PreferredSizeWidget {
  SignInAppBar({Key key, this.title}) : super(key: key);

  final String title;

  Size get preferredSize => const Size.fromHeight(65);

  @override
  _SignInAppBarState createState() => _SignInAppBarState();
}

class _SignInAppBarState extends State<SignInAppBar> {
  @override
  Widget build(BuildContext context) {
    return new AppBar(
      title: Text(widget.title, style: TextStyle(color: Colors.black)),
      backgroundColor: PrimaryColor,
      automaticallyImplyLeading: true,
      elevation: 0.0,
      bottom: PreferredSize(
        child: Container(color: SecondaryColor, height: 8.0),
        preferredSize: Size.fromHeight(8.0),
      ),
    );
  }
}
