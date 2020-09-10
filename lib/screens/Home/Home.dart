import 'package:VoilaGiftApp/colors.dart';
import 'package:VoilaGiftApp/screens/Home/body.dart';
import 'package:VoilaGiftApp/screens/Home/bottomNavBar.dart';
import 'package:VoilaGiftApp/screens/Home/homeAppBar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(title: "Voila Home"),
      bottomNavigationBar: BottomNavBar(),
      body: Body(),
      backgroundColor: BackgroundColor,
    );
  }
}
