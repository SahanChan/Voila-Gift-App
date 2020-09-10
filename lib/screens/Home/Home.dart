import 'package:VoilaGiftApp/constants.dart';
import 'package:VoilaGiftApp/models/item.dart';
// import 'package:VoilaGiftApp/screens/Home/body.dart';
import 'package:VoilaGiftApp/screens/Home/bottomNavBar.dart';
import 'package:VoilaGiftApp/screens/Home/homeAppBar.dart';
import 'package:VoilaGiftApp/screens/Home/itemList.dart';
import 'package:VoilaGiftApp/screens/OrderCart/orderCart.dart';
import 'package:VoilaGiftApp/services/database.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Item>>.value(
      value: DatabaseService().items,
      child: Scaffold(
        appBar: HomeAppBar(title: "Voila Home"),
        drawer: Drawer(
          child: Container(
            color: BackgroundColor,
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Text("Voila"),
                  decoration: BoxDecoration(color: PrimaryColor),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text('Cart'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OrderCart()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    // print("tapped settings");
                  },
                ),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Log out'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        body: ItemList(),
        backgroundColor: BackgroundColor,
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
