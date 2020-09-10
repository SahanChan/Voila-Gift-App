import 'package:VoilaGiftApp/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    // int _selectedIndex = 0;
    // void _onItemTapped(int index) {
    //   setState(() {
    //     _selectedIndex = index;
    //   });
    // }

    return BottomNavigationBar(
      backgroundColor: PrimaryColor,
      items: [
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.facebook,
            color: Colors.blue,
          ),
          title: Text(
            "Terms of use",
            style: TextStyle(color: Colors.black),
          ),
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.pinterest, color: Colors.red),
          title: Text(
            "Contact us",
            style: TextStyle(color: Colors.black),
          ),
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.instagram, color: Colors.pink),
          title: Text(
            "Privacy and policy",
            style: TextStyle(color: Colors.black),
          ),
        )
      ],
      currentIndex: 0,
      // currentIndex: _selectedIndex,
      // onTap: _onItemTapped,
    );
  }
}
