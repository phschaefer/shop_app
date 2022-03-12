import 'package:flutter/material.dart';
import 'package:shop_app/config/RouteConfig.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/screens/products_overview_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop',
      theme: ThemeData(
          colorScheme: const ColorScheme.light(
            primary: Colors.teal,
            secondary: Colors.grey,
          ),
          fontFamily: 'Lato'),
      home: ProductsOverviewScreen(),
      routes: {
        RouteConfig.productDetailScreen: (context) => const ProductDetailScreen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}