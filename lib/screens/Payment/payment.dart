import 'package:VoilaGiftApp/constants.dart';
import 'package:VoilaGiftApp/screens/OrderCart/voilaAppBar.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  Payment({Key key, this.totPrice}) : super(key: key);
  final double totPrice;

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    // print()
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: VoilaAppBar(title: "Select Payment"),
    );
  }
}
