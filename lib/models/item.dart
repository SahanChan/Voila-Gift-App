import 'package:flutter/material.dart';

class Item {
  final String title;
  final String image;
  final String description;
  final int price;
  final int id;
  final Color color;

  Item(
      {this.title,
      this.image,
      this.description,
      this.price,
      this.id,
      this.color});
}
