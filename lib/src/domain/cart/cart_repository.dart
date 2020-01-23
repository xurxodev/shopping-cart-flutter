import 'package:shopping_cart_flutter/src/domain/cart/Cart.dart';

abstract class CartRepository {
  Future<Cart> get();

  Future<bool> save(Cart cart);
}
