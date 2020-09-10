import 'package:VoilaGiftApp/models/dealsOfTheDay.dart';
// import 'package:VoilaGiftApp/models/item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference dealsOfTheDayCollection =
      Firestore.instance.collection('DealsOfTheDay');

  // Future updateUserData(String title, String desc, int price) async {
  //   return await itemCollection.document(uid).setData({
  //     'title': title,
  //     'desc': desc,
  //     'price': price,
  //   });
  // }

  //item list from snapshot

  List<DealsOfTheDay> _itemListFromSnapshots(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return DealsOfTheDay(title: doc.data['title'] ?? '');
    }).toList();
  }

  //get items stream
  Stream<List<DealsOfTheDay>> get items {
    return dealsOfTheDayCollection.snapshots().map(_itemListFromSnapshots);
  }
}
