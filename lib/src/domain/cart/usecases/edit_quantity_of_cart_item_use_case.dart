import 'package:shopping_cart_flutter/src/domain/cart/Cart.dart';
import 'package:shopping_cart_flutter/src/domain/cart/CartItem.dart';
import 'package:shopping_cart_flutter/src/domain/cart/cart_repository.dart';
import 'package:shopping_cart_flutter/src/domain/products/product.dart';

class EditQuantityOfCartItemUseCase {
  final CartRepository _cartRepository;

  EditQuantityOfCartItemUseCase(this._cartRepository);

  Future<Cart> execute(Product product) async {
    final cart = await _cartRepository.get();

    final cartItem =
        CartItem(product.id, product.image, product.title, product.price, 1);

    final editedCart = cart.addItem(cartItem);

    await _cartRepository.save(editedCart);

    return editedCart;
  }
}
