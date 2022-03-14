import 'package:flutter/material.dart';
import 'package:shop_app/widgets/ProductsGrid.dart';

enum SettingOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (SettingOptions selectedValue) {
             setState(() {
               if (selectedValue == SettingOptions.Favorites) {
                 _showOnlyFavorites = true;
               } else {
                 _showOnlyFavorites = false;
               }
             });
            },
            icon: const Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('Only Favorites'),
                value: SettingOptions.Favorites,
              ),
              const PopupMenuItem(
                child: Text('Show All'),
                value: SettingOptions.All,
              ),
            ],
          ),
        ],
      ),
      body: ProductsGrid(
        showFavoriteOnly: _showOnlyFavorites,
      ),
    );
  }
}
