import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/models/product.dart';
import '../models/cart_item.dart';
import '../providers/cart_provider.dart';

class CartScreens extends StatelessWidget {
  static const routeName = '/cart_screen';

  @override
  Widget build(BuildContext context) {
    final cartDT = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Card(
                child: Text(
                  'Total harga ${cartDT.totalHarga}',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartDT.items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        'Judul produk : ${cartDT.items.values.toList()[index].title}'),
                    subtitle: Text(
                        'Quantity : ${cartDT.items.values.toList()[index].qty}'),
                    trailing: Text(
                        'Harga : ${cartDT.items.values.toList()[index].qty * cartDT.items.values.toList()[index].price}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
