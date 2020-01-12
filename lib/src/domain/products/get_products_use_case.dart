import 'package:shopping_cart_flutter/src/domain/products/product.dart';
import 'package:shopping_cart_flutter/src/domain/products/product_repository.dart';

class GetProductsUseCase {
  ProductRepository _productRepository;

  GetProductsUseCase(this._productRepository);

  Future<List<Product>> execute(String filter) {
    return this._productRepository.get(filter);
  }
}
