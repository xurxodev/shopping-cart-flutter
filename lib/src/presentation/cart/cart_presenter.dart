import 'package:intl/intl.dart';
import 'package:shopping_cart_flutter/src/domain/cart/Cart.dart';
import 'package:shopping_cart_flutter/src/domain/cart/CartItem.dart';
import 'package:shopping_cart_flutter/src/domain/cart/usecases/add_product_to_cart_use_case.dart';
import 'package:shopping_cart_flutter/src/domain/cart/usecases/edit_quantity_of_cart_item_use_case.dart';
import 'package:shopping_cart_flutter/src/domain/cart/usecases/get_cart_use_case.dart';
import 'package:shopping_cart_flutter/src/domain/cart/usecases/remove_item_to_from_use_case.dart';
import 'package:shopping_cart_flutter/src/domain/products/get_products_use_case.dart';
import 'package:shopping_cart_flutter/src/domain/products/product.dart';
import 'package:shopping_cart_flutter/src/presentation/cart/cart_state.dart';
import 'package:shopping_cart_flutter/src/presentation/products/products_state.dart';

typedef OnCartChanged = Function(CartState cartState);

class CartPresenter {
  final GetProductsUseCase _getProductsUseCase;
  final GetCartUseCase _getCartUseCase;
  final AddProductToCartUseCase _addProductToCartUseCase;
  final RemoveItemFromCartUseCase _removeItemFromCartUseCase;
  final EditQuantityOfCartItemUseCase _editQuantityOfCartItemUseCase;

  Cart _cart;
  List<Product> _products;

  OnCartChanged _onCartChanged;

  CartPresenter(
      this._getProductsUseCase,
      this._getCartUseCase,
      this._addProductToCartUseCase,
      this._removeItemFromCartUseCase,
      this._editQuantityOfCartItemUseCase);

  Future<void> init(OnCartChanged onCartChanged) async {
    _onCartChanged = onCartChanged;
    _products =  await _getProductsUseCase.execute();
    _loadCart();
  }

  Future<void> addProductToCartCart(ProductItemState productItemState) {
    final Product product =
        _products.firstWhere((product) => product.id == productItemState.id);

    _addProductToCartUseCase.execute(product).then((cart) {
      _cart = cart;
      _render(cart);
    });
  }

  void removeCartItemOfCart(CartItemState cartItemState) {
    final CartItem cartItem =
        _cart.items.firstWhere((cartItem) => cartItem.id == cartItemState.id);

    _removeItemFromCartUseCase.execute(cartItem).then((cart) {
      _cart = cart;
      _render(cart);
    });
  }

  void editQuantityOfCartItem(CartItemState cartItemState, int quantity) {
    final CartItem cartItem =
        _cart.items.firstWhere((cartItem) => cartItem.id == cartItemState.id);

    _editQuantityOfCartItemUseCase.execute(cartItem, quantity).then((cart) {
      _cart = cart;
      _render(cart);
    });
  }

  void _loadCart() {
    _getCartUseCase.execute().then((cart) {
      _cart = cart;
      _render(cart);
    });
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
