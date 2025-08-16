import 'package:flutter/material.dart';
import 'package:studyapp/providers/all_product.dart';
import 'package:studyapp/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   final productData = Provider.of<Products>(context);

   final all_products = productData.allProduct;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: all_products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider(
        create: (context) => all_products[i], // Looping untuk semua data
        child: ProductItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}