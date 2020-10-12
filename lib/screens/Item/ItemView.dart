import 'package:VoilaGiftApp/constants.dart';
import 'package:VoilaGiftApp/screens/OrderCart/voilaAppBar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemManagement extends StatefulWidget {
  @override
  _ItemManagementState createState() => _ItemManagementState();
}

class _ItemManagementState extends State<ItemManagement> {
  var item;
  var item1;
  var item2;
  var selectedItem;
  var selectedItem1;
  var selectedItem2;

  TextEditingController _textcontroller;

  final _firestore = Firestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _textcontroller = TextEditingController();
  }

  final GlobalKey<FormState> _formkey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VoilaAppBar(title: "Item Management"),
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
                    SizedBox(
                      height: 40,
                    ),
                    Text("Select a Size"),
                    StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance
                          .collection("Dropdown-Size")
                          .snapshots(),

                      // ignore: missing_return
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          Text("Loading");
                        } else {
                          List<DropdownMenuItem> item = [];
                          for (int i = 0;
                              i < snapshot.data.documents.length;
                              i++) {
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
                              Icon(
                                (FontAwesomeIcons.pen),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              DropdownButton(
                                items: item,
                                onChanged: (item) {
                                  final snackBar = SnackBar(
                                      content: Text(
                                    'Selected size is $item',
                                    style: TextStyle(color: Color(0xff11b719)),
                                  ));
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
                    SizedBox(
                      height: 40,
                    ),
                    Text("Select a Color"),
                    StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance
                          .collection("Dropdown-color")
                          .snapshots(),

                      // ignore: missing_return
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          Text("Loading");
                        } else {
                          List<DropdownMenuItem> item1 = [];
                          for (int i = 0;
                              i < snapshot.data.documents.length;
                              i++) {
                            DocumentSnapshot snap = snapshot.data.documents[i];
                            item1.add(
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
                              Icon(
                                (FontAwesomeIcons.pen),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              DropdownButton(
                                items: item1,
                                onChanged: (item1) {
                                  final snackBar = SnackBar(
                                      content: Text(
                                    'Selected Color is $item1',
                                    style: TextStyle(color: Color(0xff11b719)),
                                  ));
                                  Scaffold.of(context).showSnackBar(snackBar);
                                  setState(() {
                                    selectedItem1 = item1;
                                  });
                                },
                                value: selectedItem1,
                                isExpanded: false,
                                hint: new Text("choose item"),
                                style: TextStyle(color: Color(0xff11b719)),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text("Select a Amount"),
                    StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance
                          .collection("Dropdown-Amount")
                          .snapshots(),

                      // ignore: missing_return
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          Text("Loading");
                        } else {
                          List<DropdownMenuItem> item2 = [];
                          for (int i = 0;
                              i < snapshot.data.documents.length;
                              i++) {
                            DocumentSnapshot snap = snapshot.data.documents[i];
                            item2.add(
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
                              Icon(
                                (FontAwesomeIcons.pen),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              DropdownButton(
                                items: item2,
                                onChanged: (item2) {
                                  final snackBar = SnackBar(
                                      content: Text(
                                    'Number of items is $item2',
                                    style: TextStyle(color: Color(0xff11b719)),
                                  ));
                                  Scaffold.of(context).showSnackBar(snackBar);
                                  setState(() {
                                    selectedItem2 = item2;
                                  });
                                },
                                value: selectedItem2,
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
            SizedBox(
              height: 40,
            ),
            Text("Enter additional customisation request for an extra fee"),
            TextFormField(
              controller: _textcontroller,
              decoration: InputDecoration(
                  icon: Icon(FontAwesomeIcons.pen),
                  hintText: 'Enter additional changes',
                  labelText: 'Description'),
            ),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
                color: ButtonColor,
                onPressed: () {
                  save();
                })
          ],
        ),
      ),
    );
  }

  void save() {
    String txt = _textcontroller.text;

    _firestore.collection("item management").document("item data").setData({
      'Size': selectedItem,
      'Color': selectedItem1,
      'Amount': selectedItem2,
      'Description': txt
    });

    print("saved");
  }
}
