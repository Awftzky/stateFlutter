import 'package:flutter/material.dart' hide Badge;
import 'package:provider/provider.dart';
import 'package:studyapp/providers/all_product.dart';
import 'package:studyapp/screens/cart_screens.dart';
import 'package:studyapp/widgets/badge.dart';

import '../providers/cart_provider.dart';

class ProductDetailScreen extends StatelessWidget {

  static const routeName = '/product-detail';

  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context) ?.settings.arguments as String;
    final product = Provider.of<Products>(context).findById(productId);
    final cartDT = Provider.of<Cart>(context , listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Product Details'),
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
      body: Column(
        children: [
          SizedBox(
            width: double.infinity ,
          height: MediaQuery.of(context).size.height * 0.3,
              child: Image.network('${product.imageUrl}' , fit: BoxFit.cover,)),

          const SizedBox(height: 15),

          Text('${product.title}' , style: const TextStyle(fontSize: 40 , fontWeight: FontWeight.bold),),

          const SizedBox(height: 15),

          Text('${product.description}' , style: const TextStyle(fontSize: 25),),

          const SizedBox(height: 15),

          Text('\$${product.price}' , style: const TextStyle(fontSize: 25),),

          const SizedBox(height: 15),
          
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreens.routeName);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('added to cart'),
                  duration: Duration(seconds: 2),));
                cartDT.addCart(product.id, product.title, product.price);
              }, child: const Text('Add to cart'))
        ],
      ),
    );
  }
}