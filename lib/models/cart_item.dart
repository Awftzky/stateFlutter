
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class CartItem {
  String id;
  String title;
  double price;
  int qty;

  CartItem(this.id, this.title, this.price, this.qty);
}