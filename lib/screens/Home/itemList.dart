import 'package:VoilaGiftApp/models/item.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    final items = Provider.of<List<Item>>(context);
    // print(items.documents);
    items.forEach((item) {
      print(item.title);
      print(item.desc);
      print(item.price);
    });
    return Container();
  }
}
