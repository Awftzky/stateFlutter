import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/models/product.dart';
import 'package:studyapp/providers/cart_provider.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final productDT = Provider.of<Product>(context , listen: false);
    final cartDT = Provider.of<Cart>(context , listen: false);

    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName,
                arguments: productDT.id ,
              );
            },
            child: Image.network(
              '${productDT.imageUrl}',
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: Consumer<Product>(
              builder: (context, productDT, child) => IconButton(
                icon: (productDT.isFavorite)
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border_outlined),
                color: Colors.amber,
                onPressed: () {
                  productDT.statusFav();
                },
              ),
            ),
            title: Text(
              '${productDT.title}',
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
                    content: const Text('added to cart'),
                duration: Duration(seconds: 2),));
                cartDT.addCart(productDT.id , productDT.title, productDT.price);
              },
              color: Colors.amber,
            ),
          ),
        ),
    );
  }
}
