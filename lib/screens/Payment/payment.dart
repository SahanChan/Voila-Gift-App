// import 'dart:html';

import 'package:VoilaGiftApp/constants.dart';
import 'package:VoilaGiftApp/screens/OrderCart/voilaAppBar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Payment extends StatefulWidget {
  Payment({Key key, this.totPrice}) : super(key: key);
  final double totPrice;

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  bool checkBoxVal1 = false;
  bool checkBoxVal2 = false;
  bool checkBoxVal3 = false;

  @override
  Widget build(BuildContext context) {
    // print()
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: VoilaAppBar(title: "Select Payment"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Checkbox(
                    activeColor: PrimaryColor,
                    checkColor: Colors.black,
                    value: checkBoxVal1,
                    onChanged: (bool val1) {
                      setState(() {
                        checkBoxVal1 = val1;
                      });
                    },
                  ),
                  Text("Cash on Delivery ?")
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.ccVisa,
                          color: Colors.blue,
                          size: 60,
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Checkbox(
                        activeColor: PrimaryColor,
                        checkColor: Colors.black,
                        value: checkBoxVal2,
                        onChanged: (bool val2) {
                          setState(() {
                            checkBoxVal2 = val2;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.ccMastercard,
                          color: Colors.blue[700],
                          size: 60,
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Checkbox(
                        activeColor: PrimaryColor,
                        checkColor: Colors.black,
                        value: checkBoxVal3,
                        onChanged: (bool val3) {
                          setState(() {
                            checkBoxVal3 = val3;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        decoration: InputDecoration(hintText: 'Card Number')),
                    TextFormField(decoration: InputDecoration(hintText: 'CVC')),
                    TextFormField(
                        decoration: InputDecoration(hintText: 'Expiry Date')),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 120,
                height: 50,
                child: Center(
                  child: Text("3200 LKR"),
                ),
                color: Colors.grey[400],
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text("Pay"),
              color: PrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
