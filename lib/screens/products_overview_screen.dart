import 'package:flutter/material.dart';
import 'package:shop_app/widgets/ProductsGrid.dart';

class ProductsOverviewScreen extends StatelessWidget {

  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Shop'),
      ),
      body: const ProductsGrid()
    );
  }
}
