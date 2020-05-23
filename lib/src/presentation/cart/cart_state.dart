import 'package:flutter/widgets.dart';

/*class CartState {
  final String totalPrice;
  final int totalItems;
  final List<CartItemState> items;

  CartState(this.totalPrice, this.totalItems, this.items);

  factory CartState.createEmpty() {
    return CartState('0 €', 0, []);
  }
}*/

abstract class CartState {
  CartState();

  factory CartState.loading() =>LoadingCartState();

  factory CartState.loaded(  String totalPrice, int totalItems,
      List<CartItemState> items) =>
      LoadedCartState(totalPrice: totalPrice, totalItems:totalItems, items: items);

  factory CartState.error(String message) => ErrorCartState(message: message);
}

class LoadingCartState extends CartState {
  LoadingCartState();
}

class LoadedCartState extends CartState {
  final String totalPrice;
  final int totalItems;
  final List<CartItemState> items;

  LoadedCartState({this.totalPrice, this.totalItems,  @required this.items});
}

class ErrorCartState extends CartState {
  final String message;

  ErrorCartState({@required this.message});
}

class CartItemState {
  final String id;
  final String image;
  final String title;
  final String price;
  final int quantity;

  CartItemState(this.id, this.image, this.title, this.price, this.quantity);
}
