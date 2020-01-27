import 'package:flutter/material.dart';
import 'package:shopping_cart_flutter/dependencies_provider.dart';
import 'package:shopping_cart_flutter/src/presentation/products/products_presenter.dart';
import 'package:shopping_cart_flutter/src/presentation/products/products_state.dart';
import 'package:shopping_cart_flutter/src/presentation/products/widgets/product_item.dart';

class ProductList extends StatelessWidget {
  final ProductsPresenter _productsPresenter;
  final void Function(ProductItemState productItemState)
      _addProductToCartCallback;

  ProductList(this._addProductToCartCallback)
      : _productsPresenter = getIt<ProductsPresenter>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductsState>(
        initialData: null,
        future: _productsPresenter.search('Element'),
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return renderProductList(context, snapshot.data);
          else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget renderProductList(BuildContext context, ProductsState state) {
    return GridView.builder(
      itemCount: state.products.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250.0, childAspectRatio: 0.58),
      itemBuilder: (context, index) {
        final ProductItemState product = state.products[index];

        return ProductItem(product, _addProductToCartCallback);
      },
    );
  }
}
