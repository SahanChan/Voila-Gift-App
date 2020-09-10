import 'package:VoilaGiftApp/models/item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference itemCollection =
      Firestore.instance.collection('Items');

  Future updateUserData(String title, String desc, int price) async {
    return await itemCollection.document(uid).setData({
      'title': title,
      'desc': desc,
      'price': price,
    });
  }

  //item list from snapshot

  List<Item> _itemListFromSnapshots(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Item(
        title: doc.data['title'] ?? '',
        desc: doc.data['desc'] ?? '',
        price: doc.data['price'] ?? 0,
      );
    }).toList();
  }

  //get items stream
  Stream<List<Item>> get items {
    return itemCollection.snapshots().map(_itemListFromSnapshots);
  }
}
