// import 'dart:html';
import 'package:VoilaGiftApp/constants.dart';
import 'package:VoilaGiftApp/screens/Delivery/deliverydetails.dart';
import 'package:VoilaGiftApp/screens/OrderCart/voilaAppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:VoilaGiftApp/models/price.dart';

class Payment extends StatefulWidget {
  final Price xprice;

  Payment({this.xprice});

  @override
  _PaymentState createState() => _PaymentState(yprice: xprice);
}

class _PaymentState extends State<Payment> {
  final Price yprice;
  _PaymentState({this.yprice});
  bool checkBoxVal1 = false;
  bool checkBoxVal2 = false;
  bool checkBoxVal3 = false;
  int group = 1;
  final _formKey = GlobalKey<FormState>();
  final cardNumber = TextEditingController();
  final cvc = TextEditingController();
  final expiryDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // print()
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: VoilaAppBar(title: "Select Payment"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
              child: Text(
                "Add credit card",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/paymentBg.png",
                      scale: 4,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Radio(
                      value: 1,
                      groupValue: group,
                      onChanged: (T) {
                        print(T);
                        setState(() {
                          group = T;
                        });
                      },
                      activeColor: PrimaryColor,
                    ),
                    Radio(
                      value: 2,
                      groupValue: group,
                      onChanged: (T) {
                        print(T);
                        setState(() {
                          group = T;
                        });
                      },
                      activeColor: PrimaryColor,
                    ),
                    Radio(
                      value: 3,
                      groupValue: group,
                      onChanged: (T) {
                        print(T);
                        setState(() {
                          group = T;
                        });
                      },
                      activeColor: PrimaryColor,
                    ),
                    Radio(
                      value: 4,
                      groupValue: group,
                      onChanged: (T) {
                        print(T);
                        setState(() {
                          group = T;
                        });
                      },
                      activeColor: PrimaryColor,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("assets/images/visa.png", scale: 3),
                    Image.asset("assets/images/mastercard.png", scale: 3),
                    Image.asset("assets/images/amExp.png", scale: 3),
                    Image.asset("assets/images/paypal.png", scale: 3)
                  ],
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(35.0, 5, 35, 0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: cardNumber,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(16)
                      ],
                      autovalidate: true,
                      decoration: InputDecoration(
                          labelText: 'Card Number',
                          hintText: "XXXX XXXX XXXX XXXX"),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Cant have empty card number";
                        } else if (value.length != 16) {
                          return "This has to be 16 numbers long";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      controller: cvc,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4)
                      ],
                      autovalidate: true,
                      decoration: InputDecoration(
                        labelText: "CVC",
                        hintText: 'XXXX',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Cant have empty CVC number";
                        } else if (value.length != 4) {
                          return "This has to be 4 numbers long";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      controller: expiryDate,
                      decoration: InputDecoration(
                          labelText: "Expiry Date", hintText: 'DD/MM/YYYY'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter expiry date";
                        } else {
                          return null;
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Total Price: ",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "${yprice.price}",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FlatButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  Firestore.instance.collection("Payment").add({
                                    'cardNumber': cardNumber.text,
                                    'cvc': cvc.text,
                                    'expiryDate': expiryDate.text,
                                    'totalPrice': yprice.price,
                                    'cardType': group,
                                    'cashOnDelivery': false
                                  });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => signUpPage(
                                                xprice: yprice,
                                              )));
                                } else {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text("This is Not Valid"),
                                  ));
                                }
                              },
                              child: Text("Confirm Payment"),
                              color: PrimaryColor,
                            ),
                            FlatButton(
                              onPressed: () {
                                Firestore.instance.collection("Payment").add({
                                  'cardNumber': null,
                                  'cvc': null,
                                  'expiryDate': null,
                                  'totalPrice': yprice.price,
                                  'cardType': null,
                                  'cashOnDelivery': true
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => signUpPage(
                                              xprice: yprice,
                                            )));
                              },
                              child: Text(
                                "Cash on Delivery",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: ButtonColor,
                            )
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
