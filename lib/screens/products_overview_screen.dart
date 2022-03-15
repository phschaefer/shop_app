import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/config/RouteConfig.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/widgets/ProductsGrid.dart';
import 'package:shop_app/widgets/badge.dart';

import '../provider/cart.dart';

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
          Consumer<Cart>(
            builder: (_, cart, child) => Badge(
                child: child,
                value: cart.itemSize.toString(),
                color: Theme.of(context).colorScheme.primary,
            ),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(RouteConfig.cartScreen);
              },
            ),
          ),
        ],
      ),
      body: ProductsGrid(
        showFavoriteOnly: _showOnlyFavorites,
      ),
    );
  }
}
