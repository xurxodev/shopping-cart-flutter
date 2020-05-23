import 'package:flutter/material.dart';
import 'package:shopping_cart_flutter/dependencies_provider.dart';
import 'package:shopping_cart_flutter/src/presentation/products/products_bloc.dart';
import 'package:shopping_cart_flutter/src/presentation/products/products_state.dart';
import 'package:shopping_cart_flutter/src/presentation/products/widgets/product_item.dart';

class ProductList extends StatelessWidget {
  final ProductsBloc _bloc;

  ProductList() : _bloc= getIt<ProductsBloc>(){
    _bloc.search('Elements');
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ProductsState>(
      initialData: _bloc.state,
      stream: _bloc.observableState,
      builder: (context, snapshot) {
        final state = snapshot.data;

        if (state is LoadingProductsState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ErrorProductsState) {
          return Center(child:Text(state.message));
        } else {
          return _renderProductList(context, state);
        }
      },
    );
  }

  Widget _renderProductList(BuildContext context, LoadedProductsState state) {
    return GridView.builder(
      itemCount: state.products.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250.0, childAspectRatio: 0.58),
      itemBuilder: (context, index) {
        final ProductItemState product = state.products[index];

        return ProductItem(product);
      },
    );
  }
}
