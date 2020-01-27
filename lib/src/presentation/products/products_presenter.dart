import 'package:intl/intl.dart';
import 'package:shopping_cart_flutter/src/domain/products/get_products_use_case.dart';
import 'package:shopping_cart_flutter/src/domain/products/product.dart';
import 'package:shopping_cart_flutter/src/presentation/products/products_state.dart';

class ProductsPresenter {
  final GetProductsUseCase _getProductsUseCase;

  ProductsPresenter(this._getProductsUseCase);

  Future<ProductsState> search(String searchTerm) {
    return _getProductsUseCase
        .execute()
        .then((products) => _mapToState(searchTerm, products));
  }

  ProductsState _mapToState(String searchTerm, List<Product> products) {
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'es-ES');

    return ProductsState(
        searchTerm,
        products.map((product) => ProductItemState(product.id, product.image,
            product.title, formatCurrency.format(product.price))).toList());
  }
}
