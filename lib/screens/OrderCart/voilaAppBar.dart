import 'package:VoilaGiftApp/constants.dart';
import 'package:flutter/material.dart';

class VoilaAppBar extends StatefulWidget implements PreferredSizeWidget {
  VoilaAppBar({Key key, this.title}) : super(key: key);

  final String title;

  Size get preferredSize => const Size.fromHeight(65);

  @override
  _VoilaAppBarState createState() => _VoilaAppBarState();
}

class _VoilaAppBarState extends State<VoilaAppBar> {
  @override
  Widget build(BuildContext context) {
    return new AppBar(
      title: Text(widget.title, style: TextStyle(color: Colors.black)),
      backgroundColor: PrimaryColor,
      automaticallyImplyLeading: true,
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0.0,
      bottom: PreferredSize(
        child: Container(color: SecondaryColor, height: 8.0),
        preferredSize: Size.fromHeight(8.0),
      ),
    );
  }
}
