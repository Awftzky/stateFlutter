import 'package:flutter/material.dart' hide Badge;
import 'package:provider/provider.dart';
import 'package:studyapp/providers/cart_provider.dart';
import 'package:studyapp/screens/cart_screens.dart';
import 'package:studyapp/widgets/product_grid.dart';
import '../widgets/badge.dart'; // Pastikan path ini benar

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          Consumer<Cart>(
            builder: (context, cart, ch) {
              return Badge(
                child: ch!,
                value: cart.jumlahItem.toString(),
                color: Colors.red,
              );
            },
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreens.routeName);
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: ProductGrid(),
    );
  }
}
