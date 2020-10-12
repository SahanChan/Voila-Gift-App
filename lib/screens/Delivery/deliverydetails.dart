import 'package:VoilaGiftApp/constants.dart';
import 'package:VoilaGiftApp/models/delivery.dart';
import 'package:VoilaGiftApp/models/price.dart';
import 'package:VoilaGiftApp/screens/Delivery/dateandtime.dart';
import 'package:VoilaGiftApp/screens/OrderCart/voilaAppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:VoilaGiftApp/screens/Delivery/orderconfirm.dart';
import 'package:VoilaGiftApp/screens/Delivery/deliverydetails.dart';
import 'package:flutter/services.dart';

class signUpPage extends StatefulWidget {
  final DeliveryDetails xdetails;
  final Price xprice;
  signUpPage({this.xprice, this.xdetails});
  @override
  _signUpPageState createState() =>
      _signUpPageState(yprice: xprice, ydetails: xdetails);
}

class _signUpPageState extends State<signUpPage> {
  final _formKey = GlobalKey<FormState>();
  final DeliveryDetails ydetails;
  final Price yprice;
  _signUpPageState({this.yprice, this.ydetails});
  final name = TextEditingController();
  final number = TextEditingController();
  final address = TextEditingController();
  final notes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VoilaAppBar(title: "Delivery"),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dear Customer,",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'sfpro'),
                    ),
                    Text(
                      "Add you'r delivery details ",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'sfpro'),
                    ),
                    TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                        labelText: "Name",
                        hintText: "John Cena",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter your name";
                        }
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10)
                      ],
                      autovalidate: true,
                      decoration: InputDecoration(
                          labelText: 'Phone Number', hintText: "94012345678"),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Cant have empty phone number";
                        } else if (value.length != 10) {
                          return "This has to be 10 numbers long";
                        }
                      },
                    ),
                    TextFormField(
                      controller: address,
                      decoration: InputDecoration(
                        labelText: "Address",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter your name";
                        }
                      },
                    ),
                    TextFormField(
                      controller: notes,
                      decoration: InputDecoration(
                        labelText: "Any Notes",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please enter your name";
                        }
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Center(
                        child: FlatButton(
                          padding: EdgeInsets.fromLTRB(25, 20, 25, 20),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              Firestore.instance
                                  .collection('DeliveryDetails')
                                  .add({
                                'name': name.text,
                                'number': number.text,
                                'address': address.text,
                                'notes': notes.text,
                              });
                              ydetails.name = name.text;
                              ydetails.address = address.text;
                              ydetails.anyNotes = notes.text;
                              ydetails.phoneNum = number.text;

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DateAndTime(
                                            xprice: yprice,
                                            xdetails: ydetails,
                                          )));
                            } else {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text("This is Not Valid"),
                              ));
                            }
                          },
                          child: Text(
                            "Add My Details",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                          color: PrimaryColor,
                        ),
                      ),
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
