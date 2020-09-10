import 'package:VoilaGiftApp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart'

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: PrimaryColor,
      child: Center(
        child: Center(
          child: SpinKitPouringHourglass(
            color: SecondaryColor,
            size: 90.0,
          ),
        ),
      ),
    );
  }
}
