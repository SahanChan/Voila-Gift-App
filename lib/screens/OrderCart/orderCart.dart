import 'package:VoilaGiftApp/constants.dart';
import 'package:VoilaGiftApp/models/item.dart';
import 'package:VoilaGiftApp/screens/Home/homeAppBar.dart';
import 'package:VoilaGiftApp/screens/OrderCart/voilaAppBar.dart';
import 'package:VoilaGiftApp/screens/Payment/payment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:VoilaGiftApp/models/price.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderCart extends StatefulWidget {
  @override
  _OrderCartState createState() => _OrderCartState();
}

class _OrderCartState extends State<OrderCart> {
  double x;
  String id;
  List<int> _counter = List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: VoilaAppBar(title: "Order Cart"),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 20, 25, 0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        DefaultTextStyle(
                          child: Container(child: Text("Total Price")),
                          style: TextStyle(color: Colors.black),
                        ),
                        StreamBuilder(
                          stream: Firestore.instance
                              .collection('OrderItems')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData)
                              return Container(child: Text("loading price"));
                            else {
                              final priceList = snapshot.data.documents;
                              double totalPrice = 0;
                              for (var i = 0; i < priceList.length; i++) {
                                totalPrice += priceList[i]['price'];
                              }
                              x = totalPrice;
                              return Container(
                                child: Text(
                                  "$totalPrice LKR",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              );
                            }
                          },
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.save,
                        color: Colors.black,
                        size: 40.0,
                      ),
                      onPressed: () {
                        print("save icon is pressed");
                      },
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder(
                  stream:
                      Firestore.instance.collection('OrderItems').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return Text("loading pls wait");
                    else {
                      final list = snapshot.data.documents;

                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return Dismissible(
                            onDismissed: (direction) {
                              setState(() async {
                                await Firestore.instance
                                    .collection('Item')
                                    .document()
                                    .delete();
                              });
                            },
                            key: ValueKey("abc"),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => ItemManagement()
                                ));
                              },
                              child: Card(
                                color: CardColor,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            child: Image.network(
                                                list[index]['imageUrl']),
                                            width: 100,
                                            height: 100,
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 8, 8, 2),
                                                child: Text(
                                                  list[index]['title'],
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  list[index]['desc'],
                                                  style: TextStyle(fontSize: 12),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Ink(
                                                height: 30.0,
                                                width: 30.0,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(7)),
                                                  color: LightPrimaryColor,
                                                ),
                                                child: IconButton(
                                                  color: Colors.black,
                                                  icon: Icon(Icons.add),
                                                  iconSize: 15,
                                                  onPressed: () {},
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        4, 0, 4, 0),
                                                child: Ink(
                                                  height: 30.0,
                                                  width: 30.0,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey[400],
                                                        width: 1.0,
                                                        style: BorderStyle.solid),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(7)),
                                                    color: Colors.white,
                                                  ),
                                                  child: Center(child: Text("1")),
                                                ),
                                              ),
                                              Ink(
                                                height: 30.0,
                                                width: 30.0,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(7)),
                                                  color: LightPrimaryColor,
                                                ),
                                                child: IconButton(
                                                  color: Colors.black,
                                                  icon: Icon(Icons.remove),
                                                  iconSize: 15,
                                                  onPressed: () {},
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 10, 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    list[index]['price']
                                                            .toString() +
                                                        " LKR",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ),
                                                  onPressed: () async {
                                                    DocumentSnapshot ref =
                                                        list[index];

                                                    await Firestore.instance
                                                        .collection("OrderItems")
                                                        .document(ref.documentID)
                                                        .delete();
                                                    setState(() {
                                                      id = null;
                                                    });
                                                  },
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: list.length,
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final total_price = Price(price: x);
          await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Payment(
                  xprice: total_price,
                ),
              ));
        },
        label: Container(
          child: Row(
            children: <Widget>[
              Text(
                "Proceed to Checkout",
                style: TextStyle(color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: LightPrimaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}


class ItemManagement extends StatefulWidget {
  @override
  _ItemManagementState createState() => _ItemManagementState();
}

class _ItemManagementState extends State<ItemManagement> {
  var item;
  var selectedItem;


  final GlobalKey<FormState> _formkey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Item management"),
      ),

      body: Form(
        key: _formkey,
        autovalidate: true,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          children: <Widget>[
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 40,),
                    Text("Select a Size"),
                    StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance.collection("Dropdown-Size").snapshots(),

                        // ignore: missing_return
                        builder: (context,snapshot) {
                          if (!snapshot.hasData) {
                            Text("Loading");
                          } else {
                            List<DropdownMenuItem> item = [];
                            for (int i = 0; i <
                                snapshot.data.documents.length; i++) {
                              DocumentSnapshot snap = snapshot.data.documents[i];
                              item.add(
                                DropdownMenuItem(
                                  child: Text(
                                    snap.documentID,
                                    style: TextStyle(color: Color(0xff11b719)),
                                  ),

                                  value: "${snap.documentID}",
                                ),
                              );
                            }
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon((FontAwesomeIcons.pen),
                                ),
                                SizedBox(width: 50,),
                                DropdownButton(
                                  items: item,
                                  onChanged: (item) {
                                    final snackBar = SnackBar(
                                        content: Text('Selected Item is $item',
                                          style: TextStyle(
                                              color: Color(0xff11b719)
                                          ),
                                        )
                                    );
                                    Scaffold.of(context).showSnackBar(snackBar);
                                    setState(() {
                                      selectedItem = item;
                                    });
                                  },
                                  value: selectedItem,
                                  isExpanded: false,
                                  hint: new Text("choose item"),
                                  style: TextStyle(color: Color(0xff11b719)),
                                ),
                              ],
                            );
                          }
                        },
                    ),
                    SizedBox(height: 40,),
                    Text("Select a Color"),
                    StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance.collection("Dropdown-color").snapshots(),

                      // ignore: missing_return
                      builder: (context,snapshot) {
                        if (!snapshot.hasData) {
                          Text("Loading");
                        } else {
                          List<DropdownMenuItem> item = [];
                          for (int i = 0; i <
                              snapshot.data.documents.length; i++) {
                            DocumentSnapshot snap = snapshot.data.documents[i];
                            item.add(
                              DropdownMenuItem(
                                child: Text(
                                  snap.documentID,
                                  style: TextStyle(color: Color(0xff11b719)),
                                ),

                                value: "${snap.documentID}",
                              ),
                            );
                          }
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon((FontAwesomeIcons.pen),
                              ),
                              SizedBox(width: 50,),
                              DropdownButton(
                                items: item,
                                onChanged: (item) {
                                  final snackBar = SnackBar(
                                      content: Text('Selected Item is $item',
                                        style: TextStyle(
                                            color: Color(0xff11b719)
                                        ),
                                      )
                                  );
                                  Scaffold.of(context).showSnackBar(snackBar);
                                  setState(() {
                                    selectedItem = item;
                                  });
                                },
                                value: selectedItem,
                                isExpanded: false,
                                hint: new Text("choose item"),
                                style: TextStyle(color: Color(0xff11b719)),
                              ),
                            ],
                          );
                        }
                      },
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(
                  FontAwesomeIcons.pen
                ),
                 hintText: 'Enter additional changes',
                labelText: 'Description'
              ),
            )
          ],
        ),

      ),

    );
  }
}
