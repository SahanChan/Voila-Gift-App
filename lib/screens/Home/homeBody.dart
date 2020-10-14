import 'package:VoilaGiftApp/constants.dart';
import 'package:VoilaGiftApp/models/item.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'categories.dart';
import 'package:VoilaGiftApp/screens/Item/details.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ViolaHome extends StatefulWidget {
  @override
  _ViolaHomeState createState() => _ViolaHomeState();
}

class _ViolaHomeState extends State<ViolaHome> {
  String id;
  final db = Firestore.instance;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Text(
            "Featured Items",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Categories(),
        StreamBuilder(
          stream: Firestore.instance.collection("Items").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text("loading");
            } else {
              final items = snapshot.data.documents;

              return Expanded(
                  child: GridView.builder(
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    color: CardColor,
                    margin: EdgeInsets.all(10),
                    child: Column(children: [
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        width: 150,
                        height: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: (items[index]['imageUrl'] == null)
                              ? Image.asset("assets/images/placeholder.png")
                              : Image.network(items[index]['imageUrl']),
                        ),
                      ),
                      Container(
                        child: Text(
                          items[index]['title'],
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            items[index]['price'].toString() + " LKR",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.shopping_cart,
                              color: PrimaryColor,
                            ),
                            onPressed: () async {
                              Fluttertoast.showToast(
                                  msg: "Item added to cart",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.yellowAccent,
                                  textColor: Colors.black,
                                  fontSize: 16.0);
                              print("added");
                              DocumentReference ref =
                                  await db.collection("OrderItems").add({
                                'title': items[index]['title'],
                                'desc': items[index]['desc'],
                                'imageUrl': items[index]['imageUrl'],
                                'price': items[index]['price']
                              });
                              setState(() {
                                id = ref.documentID;
                              });
                              print(ref.documentID);
                            },
                          )
                        ],
                      ),
                    ]),
                  );
                },
              ));
            }
          },
        ),
      ],
    );
  }
}
