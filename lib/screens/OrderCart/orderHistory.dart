import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'voilaAppBar.dart';

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: VoilaAppBar(title: "Order History and Saves"),
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: StreamBuilder(
            stream: Firestore.instance.collection('Order History').snapshots(),
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
                              .collection('Order History')
                              .document()
                              .delete();
                        });
                      },
                      key: ValueKey("abc"),
                      child: Card(
                        color: CardColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 8, 8, 2),
                                        child: Center(
                                          child: Text(
                                            list[index]['title'],
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text(
                                            "Ordered Date: " +
                                                list[index]['orderedDate'],
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text(
                                            list[index]['items']['title1'],
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text(
                                            list[index]['items']['title2'],
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: list.length,
                );
              }
            }),
      ),
    );
  }
}
