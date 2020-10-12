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
  final _myformKey = GlobalKey<FormState>();
  DeliveryDetails ydetails = DeliveryDetails();
  final Price yprice;
  _signUpPageState({this.yprice, this.ydetails});
  final personname = TextEditingController();
  final number = TextEditingController();
  final address = TextEditingController();
  final notes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VoilaAppBar(title: "Delivery"),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                child: Image.asset("assets/images/details.png"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Dear Customer,",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Add you'r delivery details ",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Form(
                key: _myformKey,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(35.0, 5, 35, 0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: personname,
                        autovalidate: true,
                        decoration: InputDecoration(

                            labelText:'Name', hintText: "Your name"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "You must have a name";
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        controller: number,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          //FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10)
                        ],
                        autovalidate: true,
                        decoration: InputDecoration(
                          labelText: "Phone Number",
                          hintText: '94XXXXXXXX',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Cant have empty phone number";
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        controller: address,
                        decoration: InputDecoration(
                          labelText: "Delivery Adress",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please enter Address";
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        controller: notes,
                        decoration: InputDecoration(
                          labelText: "Any Notes",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              FlatButton(

                                onPressed: () {

                                  final DeliveryDetails details =
                                      DeliveryDetails(
                                          name: personname.text,
                                          phoneNum: number.text,
                                          address: address.text,
                                          anyNotes: notes.text);
                                  if (_myformKey.currentState.validate()) {
                                    Firestore.instance
                                        .collection("DeliveryDetails")
                                        .add({
                                      'name': personname.text,
                                      'number': number.text,
                                      'address': address.text,
                                      'notes': notes.text,
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DateAndTime(
                                                xprice: yprice,
                                                xdetails: details)));
                                  } else {
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text("This is Not Valid"),
                                    ));

                                  }

                                },
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  height: 60,
                                  decoration: BoxDecoration(
                                      gradient:
                                      LinearGradient(colors: [Colors.orange, Colors.red])),
                                  child: Center(
                                      child: Text(
                                        "Place Order",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20,
                              ),
                              )
                                  )
                                )
                              )
                            ]


                      ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
