import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studyapp/providers/all_product.dart';
import 'package:studyapp/providers/cart_provider.dart';
import 'package:studyapp/screens/cart_screens.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // PROVIDER
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Products()),
        ChangeNotifierProvider(create: (context) => Cart()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.indigo,
              secondary: Colors.amber
            ),
            fontFamily: 'Lato',
          ),
          home: ProductsOverviewScreen(),

          // ROUTES
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreens.routeName : (context) => CartScreens(),
          },
        ),
    );
  }
}
