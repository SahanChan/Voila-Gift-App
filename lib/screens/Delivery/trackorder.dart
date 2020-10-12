import 'package:VoilaGiftApp/models/delivery.dart';
import 'package:VoilaGiftApp/screens/OrderCart/voilaAppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:VoilaGiftApp/screens/Home/Home.dart';
import 'package:VoilaGiftApp/screens/OrderCart/orderCart.dart';

class trackOrderPage extends StatefulWidget {
  final DeliveryDetails xdetails;
  trackOrderPage({this.xdetails});
  @override
  _trackOrderPageState createState() =>
      _trackOrderPageState(ydetails: xdetails);
}

class _trackOrderPageState extends State<trackOrderPage> {
  final DeliveryDetails ydetails;
  _trackOrderPageState({this.ydetails});
  @override
  Widget build(BuildContext context) {
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
                  fontSize: 15,
                ),
              ),
              Text(
                "Order confirmed. Ready to pick",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
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
                      statusWidget('onBoard2', "Picked Up", false),
                      statusWidget('servicesImg', "In Process", false),
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
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
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
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => OrderCart()));
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
                          color: Colors.grey,
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
                        image: AssetImage("asset/images/visa.png"),
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
