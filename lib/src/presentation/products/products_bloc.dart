import 'package:intl/intl.dart';
import 'package:shopping_cart_flutter/src/common/bloc/bloc.dart';
import 'package:shopping_cart_flutter/src/domain/products/get_products_use_case.dart';
import 'package:shopping_cart_flutter/src/domain/products/product.dart';
import 'package:shopping_cart_flutter/src/presentation/products/products_state.dart';

class ProductsBloc extends Bloc<ProductsState> {
  final GetProductsUseCase _getProductsUseCase;

  ProductsBloc(this._getProductsUseCase) {
    changeState(ProductsState.loading(searchTerm: ''));
  }

  void search(String searchTerm) {
    _getProductsUseCase.execute().then((products) {
      changeState(ProductsState.loaded(
          state.searchTerm, _mapProductsToState(products)));
    }).catchError((error) {
      changeState(
          ProductsState.error(state.searchTerm, 'A network error has ocurrd'));
    });
  }

  List<ProductItemState> _mapProductsToState(List<Product> products) {
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'es-ES');

    return products
        .map((product) => ProductItemState(product.id, product.image,
            product.title, formatCurrency.format(product.price)))
        .toList();
  }
}
