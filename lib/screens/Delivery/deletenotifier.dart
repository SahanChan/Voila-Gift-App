import 'package:VoilaGiftApp/screens/Delivery/trackorder.dart';
import 'package:VoilaGiftApp/models/delivery.dart';
import 'dart:collection';
import 'package:flutter/material.dart';


class DeleteNotifier with ChangeNotifier{
  List<DeliveryDetails> _deletelist =[];
  DeliveryDetails _currentdetail;

  UnmodifiableListView<DeliveryDetails> get deletelist => UnmodifiableListView(_deletelist);

  DeliveryDetails get currentdetail => _currentdetail;

  set deletelist(List<DeliveryDetails> deletelist){
    _deletelist = deletelist;
    notifyListeners();

  }

  set currentdetail(DeliveryDetails details){
    _currentdetail = details;
    notifyListeners();
  }

  adddetail(DeliveryDetails details){
    _deletelist.insert((0), details);
    notifyListeners();
  }

  deletedetails(DeliveryDetails, details){
    _deletelist.removeWhere((_details) => _details.name == details.name);
    notifyListeners();
  }


}