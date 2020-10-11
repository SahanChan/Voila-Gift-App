import 'package:VoilaGiftApp/screens/Delivery/orderconfirm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:VoilaGiftApp/screens/Delivery/orderconfirm.dart';
import 'package:VoilaGiftApp/screens/Delivery/deliverydetails.dart';
//import 'package:flutter_app2/custform.dart';


class custform extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),

    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {

  Map Date;

  final deldate = TextEditingController();
  final deltime = TextEditingController();
  final pickdate = TextEditingController();
  final picktime = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
        ),

        title: Text("Select Date and Time", style: TextStyle(
            color: Colors.black

        ),),
        actions: [IconButton(icon: Icon(Icons.notifications),
        )
        ],
      ),

      body: Container(

        padding: EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pick Up Date", style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  dateWidget("Mon", "20 Oct", true),
                  dateWidget("Tue", "21 Oct", false),
                  dateWidget("Wed", "22 Oct", true),
                  dateWidget("Thu", "23 Oct", false),
                  dateWidget("Fri", "24 Oct", true),
                  dateWidget("Sat", "25 Oct", false),
                  dateWidget("Sun", "26 Oct", true),
                ],

              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(height: 15,),
            Text(
              "Pick Up Time", style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 15,),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    timeWidget("10.00 AM to 11.00 PM", false),
                    timeWidget("11.00 AM to 12.00 PM", true),
                    timeWidget("12.00 PM to 1.00 PM", false),
                    timeWidget("1.00 PM to 2.00 PM", true),
                    timeWidget("2.00 PM to 3.00 PM", false),
                    timeWidget("4.00 PM to 5.00 PM", true),
                    timeWidget("5.00 PM to 6.00 PM", false),
                  ],
                )
            ),

            SizedBox(height: 15,),
            Text(
              "Delivery Date", style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 15,),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    dateWidget("Mon", "20 Oct", true),
                    dateWidget("Tue", "21 Oct", false),
                    dateWidget("Wed", "22 Oct", true),
                    dateWidget("Thu", "23 Oct", false),
                    dateWidget("Fri", "24 Oct", true),
                    dateWidget("Sat", "25 Oct", false),
                    dateWidget("Sun", "26 Oct", true),
                  ],
                )
            ),

            SizedBox(
              height: 15,
            ),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(height: 15,),
            Text(
              "Pick Up Time", style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 15,),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    timeWidget("10.00 AM to 11.00 PM", false),
                    timeWidget("11.00 AM to 12.00 PM", true),
                    timeWidget("12.00 PM to 1.00 PM", false),
                    timeWidget("1.00 PM to 2.00 PM", true),
                    timeWidget("2.00 PM to 3.00 PM", false),
                    timeWidget("4.00 PM to 5.00 PM", true),
                    timeWidget("5.00 PM to 6.00 PM", false),
                  ],
                )
            ),
            Expanded(child: Container(),
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Amount to be payable",
                  style: TextStyle(fontWeight: FontWeight.bold),),
                Text("\$225", style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 10,),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => orderConfirm()));

                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: 70,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.orange, Colors.red])
                  ),
                  child: Center(
                    child: Text("Place Order",
                      style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

  Container timeWidget(String time, bool isActive) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: (isActive) ? Colors.orange : Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    child: InkWell(
    onTap: addtime,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time, style: TextStyle(fontWeight: FontWeight.bold,
            color: (isActive) ? Colors.white : Colors.black,
          ),)
        ],
      ),
    )
    );
  }

  Container dateWidget(String day, String date, bool isActive) {
    var contentStyle;
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: (isActive) ? Colors.orange : Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
        child: InkWell(
          onTap: adddatee,
          child: Column(


        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(day, style: TextStyle(fontWeight: FontWeight.bold,
              color: (isActive) ? Colors.white : Colors.black,
              fontSize: 15
          ),),
          Text(date, style: TextStyle(fontWeight: FontWeight.bold,
              color: (isActive) ? Colors.white : Colors.black,
              fontSize: 15
          ),),


        ]),
        )
    );


  }
  void adddatee() {
    Map<String, dynamic> demodate = {"DATE": "Monday 20 Oct"};
    CollectionReference collectionReference = Firestore.instance.collection('Delivery Date');
    collectionReference.add(demodate);
  }

  void addtime() {
    Map<String, dynamic> demotime = {"TIME": "10AM to 11AM"};
    CollectionReference collectionReference = Firestore.instance.collection('Delivery Time');
    collectionReference.add(demotime);
  }

}
