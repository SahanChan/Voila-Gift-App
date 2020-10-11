
import 'package:VoilaGiftApp/screens/Delivery/dateandtime.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:VoilaGiftApp/screens/Delivery/orderconfirm.dart';
import 'package:VoilaGiftApp/screens/Delivery/deliverydetails.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: signUpPage(),
    );
  }
}
class signUpPage extends StatefulWidget {
  @override
  _signUpPageState createState() => _signUpPageState();

}

class _signUpPageState extends State<signUpPage> {
  final name = TextEditingController();
  final number = TextEditingController();
  final address = TextEditingController();
  final notes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  /*image: DecorationImage(
                      image: AssetImage('asset/images/logo.png')
                  )*/
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Dear Customer,", style: TextStyle(
                      color: Colors.orange,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'sfpro'
                  ),),
                  Text("Add You'r Delivery Details", style: TextStyle(
                      color: Colors.orange,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'sfpro'
                  ),),
                  SizedBox(height: 10,),

                  TextField(
                    controller: name,
                    decoration: InputDecoration(
                      labelText: "Name",

                    ),
                    
                  ),

                  TextField(
                    controller: number,
                    decoration: InputDecoration(
                      labelText: "Phone Number",
                    ),
                  ),
                  TextField(
                    controller: address,
                    decoration: InputDecoration(
                      labelText: "Address",
                    ),
                  ),
                  SizedBox(height: 40,),
                  TextField(
                    controller: notes,
                    decoration: InputDecoration(
                      labelText: "Any Notes",
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(

                      padding: EdgeInsets.symmetric(vertical: 20),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          gradient: LinearGradient(
                              colors: [Color(0xfff3953b), Color(0xffe57509)],
                              stops: [0,1],
                              begin: Alignment.topCenter
                          )
                      ),

                      child: InkWell(
                        onTap: openSignPage,
                        child: Text("                       Add My Details", style: TextStyle(

                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'sfpro'
                        ),),
                      )

                  ),
                  SizedBox(height: 10,),

                ],
              ),
            ),

            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
  void openSignPage()
  {


    Firestore.instance.collection('DeliveryDetails').add({
      'name': name.text,
      'number' : number.text,
      'address' : address.text,
      'notes' : notes.text,
    }).then((_) {

      DocumentReference documentReference=Firestore.instance.collection('DeliveryDetails').document(name.text)
          .collection('DeliveryDetails').document(number.text);

      documentReference.get().then((datasnapshot){
        print(datasnapshot.data[name.text]);
        print(datasnapshot.data[number.text]);
        print(datasnapshot.data[address.text]);
        print(datasnapshot.data[notes.text]);
      }
      );

    });
    Navigator.push(context, MaterialPageRoute(builder: (context)=>custform()));
  }
}