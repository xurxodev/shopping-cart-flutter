import 'package:shopping_cart_flutter/src/domain/products/product.dart';

abstract class ProductRepository {
  Future<List<Product>> get();
}
