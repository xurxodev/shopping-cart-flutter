import 'package:flutter/material.dart';
import 'package:shopping_cart_flutter/src/data/products/product_in_memory_repository.dart';
import 'package:shopping_cart_flutter/src/domain/products/get_products_use_case.dart';
import 'package:shopping_cart_flutter/src/domain/products/product_repository.dart';
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
        child: ProductList(provideProductPresenter()),
      ),
    );
  }

  ProductsPresenter provideProductPresenter(){
    final ProductRepository productRepository = ProductInMemoryRepository();
    final GetProductsUseCase getProductsUseCase = GetProductsUseCase(productRepository);
    return ProductsPresenter(getProductsUseCase);
  }
}
