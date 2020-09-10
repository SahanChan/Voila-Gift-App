import 'package:VoilaGiftApp/constants.dart';
import 'package:VoilaGiftApp/screens/OrderCart/orderCart.dart';
import 'package:VoilaGiftApp/services/auth.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  Size get preferredSize => const Size.fromHeight(65);
  HomeAppBar({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      title: Text(widget.title, style: TextStyle(color: Colors.black)),
      backgroundColor: PrimaryColor,
      automaticallyImplyLeading: true,
      elevation: 0.0,
      bottom: PreferredSize(
        child: Container(color: SecondaryColor, height: 8.0),
        preferredSize: Size.fromHeight(8.0),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.share,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart, color: Colors.black),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => OrderCart()));
          },
        ),
        IconButton(
          icon: Icon(
            Icons.person,
            color: Colors.black,
          ),
          onPressed: () async {
            await _auth.signOut();
          },
        ),
      ],
    );
  }
}
