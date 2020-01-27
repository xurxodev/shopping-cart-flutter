import 'package:intl/intl.dart';
import 'package:shopping_cart_flutter/src/domain/cart/Cart.dart';
import 'package:shopping_cart_flutter/src/domain/cart/usecases/add_product_to_cart_use_case.dart';
import 'package:shopping_cart_flutter/src/domain/cart/usecases/edit_quantity_of_cart_item_use_case.dart';
import 'package:shopping_cart_flutter/src/domain/cart/usecases/get_cart_use_case.dart';
import 'package:shopping_cart_flutter/src/domain/cart/usecases/remove_item_to_from_use_case.dart';
import 'package:shopping_cart_flutter/src/presentation/cart/cart_state.dart';

typedef OnCartChanged = Function(CartState cartState);

class CartPresenter {
  final GetCartUseCase _getCartUseCase;
  final AddProductToCartUseCase _addProductToCartUseCase;
  final RemoveItemFromCartUseCase _removeItemFromCartUseCase;
  final EditQuantityOfCartItemUseCase _editQuantityOfCartItemUseCase;

  OnCartChanged _onCartChanged;

  CartPresenter(this._getCartUseCase, this._addProductToCartUseCase,
      this._removeItemFromCartUseCase, this._editQuantityOfCartItemUseCase);

  void init(OnCartChanged onCartChanged) {
    _onCartChanged = onCartChanged;
    _loadCart();
  }

  void _loadCart() {
    _getCartUseCase.execute().then((cart) => _render(cart));
  }

  void _render(Cart cart) {
    if (_onCartChanged != null) {
      _onCartChanged(_mapToState(cart));
    }
  }

  CartState _mapToState(Cart cart) {
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'es-ES');

    return CartState(
        formatCurrency.format(cart.totalPrice),
        cart.totalItems,
        cart.items
            .map((cartItem) => CartItemState(
                cartItem.id,
                cartItem.image,
                cartItem.title,
                formatCurrency.format(cartItem.price),
                cartItem.quantity))
            .toList());
  }
}
