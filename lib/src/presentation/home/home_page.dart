import 'package:flutter/material.dart';
import 'package:shopping_cart_flutter/dependencies_provider.dart';
import 'package:shopping_cart_flutter/src/presentation/home/my_app_bar.dart';
import 'package:shopping_cart_flutter/src/presentation/products/products_presenter.dart';
import 'package:shopping_cart_flutter/src/presentation/products/widgets/product_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ProductList(getIt<ProductsPresenter>()),
      ),
    );
  }
}
