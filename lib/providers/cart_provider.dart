import 'package:flutter/material.dart';
import 'package:studyapp/models/cart_item.dart';

class Cart with ChangeNotifier {
  late Map<String , CartItem> _items = {};

  Map<String , CartItem> get items => _items;

  int get jumlahItem {
    return _items.length ;
  }

  double get totalHarga {
    var total = 0.0;
    _items.forEach((key, CartItem) {
      total += CartItem.qty * CartItem.price;
    },);
    return total;
  }

  void addCart(String productId , String title , double price){
    if(_items.containsKey(productId)){
      items.update(productId, (value) => CartItem(
          value.id ,
          value.title ,
          value.price,
          value.qty + 1));
    } else {
      _items.putIfAbsent(productId, () => CartItem(
          DateTime.now().toString(),
          title,
          price,
          1
      ),
      );
    }
    notifyListeners();
  }
}