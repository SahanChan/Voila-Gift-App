import 'dart:collection';
import 'package:VoilaGiftApp/models/delivery.dart';
import 'package:VoilaGiftApp/screens/OrderCart/voilaAppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:VoilaGiftApp/screens/Home/Home.dart';
import 'package:VoilaGiftApp/screens/OrderCart/orderCart.dart';
import 'package:VoilaGiftApp/screens/Delivery/deletenotifier.dart';
import 'package:provider/provider.dart';



class trackOrderPage extends StatefulWidget {
  final DeliveryDetails xdetails;
  trackOrderPage({this.xdetails});
  @override
  _trackOrderPageState createState() =>
      _trackOrderPageState(ydetails: xdetails);
}

class _trackOrderPageState extends State<trackOrderPage> {
  String name;

  final db = Firestore.instance;
  final DeliveryDetails ydetails;

  _trackOrderPageState({this.ydetails});

  @override
  Widget build(BuildContext context) {
      /*DeleteNotifier deletenotifier = Provider.of<DeleteNotifier>(context);

      _ondetail(DeliveryDetails details){
        Navigator.pop(context);
        deletenotifier.deletedetails(details,details);
      }*/


    return Scaffold(
      appBar: VoilaAppBar(title: "Track Order"),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Order Person name: ${ydetails.name} ",
                style: TextStyle(
                  fontSize: 20,

                ),

              ),
              SizedBox(height: 10),

              Text(
                "Order confirmed. Ready to pick  ",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,

                ),

              ),
              SizedBox(height: 10),
              GestureDetector(


                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Home()));
                },

                child: Container(

                  padding:
                  EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: Colors.orange,

                      )),
                  child: Text(

                    "Edit Details",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),


              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                height: 1,
                color: Colors.grey,
              ),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 13, top: 50),
                    width: 4,
                    height: 400,
                    color: Colors.grey,
                  ),
                  Column(
                    children: [
                      statusWidget('confirmed', "Confirmed", true),
                      statusWidget('onBoard1', "Picked Up", false),
                      statusWidget('onBoard', "In Process", false),
                      statusWidget('shipped', "Shipped", false),
                      statusWidget('Delivery', "Delivered", false),
                    ],
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                height: 1,
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                   /* onTap: () => deletedetails(deletenotifier.currentdetail,
                                      _ondetail),*/
                    child: Container(

                      padding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                            color: Colors.orange,
                          )),
                      child: Text(
                        "Cancel Order",
                        style: TextStyle(
                          fontSize: 16,

                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),


                  GestureDetector(

                    onTap: () async {

                    },
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.orange,
                      ),
                      child: Text(
                        "My Orders",
                        style: TextStyle(
                          fontSize: 16,

                          color: Colors.black,
                        ),
                      ),
                    ),

                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container statusWidget(String img, String status, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (isActive) ? Colors.orange : Colors.white,
                border: Border.all(
                    color: (isActive) ? Colors.transparent : Colors.orange,
                    width: 3)),
          ),
          SizedBox(
            width: 50,
          ),
          Column(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/$img.png"),

                        fit: BoxFit.contain)),
              ),
              Text(
                status,
                style: TextStyle(
                    fontSize: 16,
                    color: (isActive) ? Colors.orange : Colors.black),
              )
            ],
          )
        ],
      ),

    );
  }
}



deletedetails(DeliveryDetails details,Function detaildel) async{
  await Firestore.instance.collection('DeliveryDetails').document(details.name).delete();
  detaildel(details);
}



