import 'package:VoilaGiftApp/constants.dart';
import 'package:VoilaGiftApp/models/delivery.dart';
import 'package:VoilaGiftApp/screens/Delivery/trackorder.dart';
import 'package:VoilaGiftApp/screens/OrderCart/voilaAppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:VoilaGiftApp/screens/Home/Home.dart';

class OrderConfirm extends StatefulWidget {
  final DeliveryDetails xdetails;
  OrderConfirm({this.xdetails});
  @override
  _OrderConfirmState createState() => _OrderConfirmState(ydetails: xdetails);
}

class _OrderConfirmState extends State<OrderConfirm> {
  final DeliveryDetails ydetails;
  _OrderConfirmState({this.ydetails});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: VoilaAppBar(title: "Order Confirmed"),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    child: Image.asset("assets/images/onBoard2.png"),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Thank You For Choosing Us!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "You'r order has been placed and the item will be delivered soon ",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Text(
                          "      Name:   ${ydetails.name}",
                          style: TextStyle(color: Colors.orange,
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const Divider(
                          color: Colors.black,
                          height: 20,
                          thickness: 5,
                          indent: 20,
                          endIndent: 0,
                        ),
                        Text("Phone Number:   ${ydetails.phoneNum}",
                            style: TextStyle(color: Colors.orange,
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const Divider(
                          color: Colors.black,
                          height: 20,
                          thickness: 5,
                          indent: 20,
                          endIndent: 0,
                        ),
                        Text("    Address:   ${ydetails.address}",
                            style: TextStyle(color: Colors.orange,
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  trackOrderPage(xdetails: ydetails)));
                    },
                    child: Container(
                        padding: EdgeInsets.all(5),
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                            gradient:
                            LinearGradient(colors: [Colors.orange, Colors.red])),
                        child: Center(
                            child: Text(
                              "Track Order",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            )
                        )
                    )

                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: Container(
                        padding: EdgeInsets.all(10),
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                            gradient:
                            LinearGradient(colors: [Colors.red, Colors.orange])),
                        child: Center(
                            child: Text(
                              "Return To Homepage",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            )
                        )
                    )

                  ),
                ],
              ),
            ],
          ),
        ));
  }
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             StreamBuilder(
  //                 stream: Firestore.instance
  //                     .collection("DeliveryDetails")
  //                     .snapshots(),
  //                 // ignore: missing_return
  //                 builder: (context, snapshot) {
  //                   if (snapshot.hasData) {
  //                     return ListView.builder(
  //                         itemCount: snapshot.data.documents.length,
  //                         shrinkWrap: true,
  //                         itemBuilder: (context, index) {
  //                           DocumentSnapshot documentSnapshot =
  //                               snapshot.data.documents[index];
  //                           return Row(
  //                             children: <Widget>[
  //                               Expanded(
  //                                 child: Text(documentSnapshot["name"]),
  //                               ),
  //                             ],
  //                           );
  //                         });
  //                   }
  //                 }),
  //             Text(
  //               "Order ID",
  //               style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
  //             ),
  //             Container(
  //               padding: EdgeInsets.all(10),
  //               decoration: BoxDecoration(
  //                 gradient: LinearGradient(colors: [Colors.orange, Colors.red]),
  //                 borderRadius: BorderRadius.all(Radius.circular(10)),
  //               ),
  //               child: Text(
  //                 "1001",
  //                 style: TextStyle(fontSize: 15, color: Colors.black),
  //               ),
  //             ),
  //           ],
  //         ),
  //         divider(),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               "Item",
  //               style: TextStyle(
  //                   fontSize: 15,
  //                   color: Colors.black,
  //                   fontWeight: FontWeight.bold),
  //             ),
  //             Text(
  //               "1* Cake",
  //               style: TextStyle(fontSize: 15, color: Colors.black),
  //             ),
  //           ],
  //         ),
  //         divider(),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               "Pick Up Date And Time",
  //               style: TextStyle(
  //                   fontSize: 15,
  //                   color: Colors.black,
  //                   fontWeight: FontWeight.bold),
  //             ),
  //             Text(
  //               "Wednesday, 07 Aug,2020. Between 10.00 AM and 12.00 PM",
  //               style: TextStyle(fontSize: 16, color: Colors.grey),
  //             ),
  //           ],
  //         ),
  //         divider(),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               "Payment method",
  //               style: TextStyle(
  //                 fontSize: 15,
  //                 color: Colors.black,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             Text(
  //               "Cash",
  //               style: TextStyle(
  //                 fontSize: 15,
  //                 color: Colors.black,
  //               ),
  //             ),
  //           ],
  //         ),
  //         Expanded(
  //           child: Container(),
  //         ),
  //         InkWell(
  //             onTap: () {
  //               Navigator.push(context,
  //                   MaterialPageRoute(builder: (context) => trackOrderPage()));
  //             },
  //             child: Container(
  //               padding: EdgeInsets.all(20),
  //               height: 70,
  //               decoration: BoxDecoration(
  //                   gradient:
  //                       LinearGradient(colors: [Colors.orange, Colors.red])),
  //               child: Center(
  //                 child: Text(
  //                   "Track Order",
  //                   style: TextStyle(
  //                     fontWeight: FontWeight.bold,
  //                     color: Colors.white,
  //                     fontSize: 20,
  //                   ),
  //                 ),
  //               ),
  //             ))
  //       ]),
  //     ),
  //   );
  // }

  // Container divider() {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 15),
  //     height: 1,
  //     color: Colors.grey,
  //   );
  // }
}
