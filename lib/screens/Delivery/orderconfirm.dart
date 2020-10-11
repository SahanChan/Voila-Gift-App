import 'package:VoilaGiftApp/screens/Delivery/trackorder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Orderconfirm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: orderConfirm(),
    );
  }
}

class orderConfirm extends StatefulWidget {
  @override
  _orderConfirmState createState() => _orderConfirmState();
}


class _orderConfirmState extends State<orderConfirm>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
        ),

        title: Text("Order Confirmed", style: TextStyle(
            color: Colors.black

        ),),
        actions: [IconButton(icon: Icon(Icons.notifications),
        )
        ],
      ),


      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("asset/images/onBoard2.png"),
                  )
              ),
            ),
            SizedBox(height: 15,),
            Text("Thank You For Choosing Us!", style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Text("You'r order has been placed and the item will be delivered soon", style:  TextStyle(fontSize: 15, ),),
            SizedBox(height: 10,),
            
            Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StreamBuilder(
                  stream: Firestore.instance.collection("DeliveryDetails").snapshots(),
                // ignore: missing_return
                builder: (context , snapshot){
                    if(snapshot.hasData){
                      return ListView.builder(itemCount: snapshot.data.documents.length,
                        shrinkWrap: true,
                      itemBuilder: (context, index){
                        DocumentSnapshot documentSnapshot = snapshot.data.documents[index];
                      return Row(
                              children: <Widget>[
                                Expanded(child: Text(documentSnapshot["name"]),

                                ),
                        ],
                      );
                      }
                      );
                    }
                }
                ),
                Text("Order ID", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient:  LinearGradient(
                        colors: [Colors.orange, Colors.red]),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),

                  child: Text("1001", style: TextStyle(fontSize: 15, color: Colors.black ),),

                ),

              ],
            ),
            divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Item", style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),),
                Text("1* Cake", style: TextStyle(fontSize: 15, color: Colors.black ),),
              ],
            ),
            divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Pick Up Date And Time", style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold ),),
                Text("Wednesday, 07 Aug,2020. Between 10.00 AM and 12.00 PM", style: TextStyle(fontSize: 16, color: Colors.grey),),
              ],
            ),
            divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Payment method", style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold,),),
                Text("Cash", style: TextStyle(fontSize: 15, color: Colors.black ,),),
              ],
            ),
            Expanded(child: Container(),
            ),
            InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>trackOrderPage()));
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: 70,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.orange, Colors.red])
                  ),
                  child: Center(
                    child: Text("Track Order", style: TextStyle(fontWeight: FontWeight.bold,
                      color:Colors.white,
                      fontSize: 20,
                    ),),
                  ),
                )
                
            )
  ]
        ),
      ),
    );
  }
  
  Container divider()
  {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      height: 1,
      color: Colors.grey,
    );
  }

}
