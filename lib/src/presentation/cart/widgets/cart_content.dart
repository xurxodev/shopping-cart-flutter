import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart_flutter/src/presentation/cart/cart_state.dart';
import 'package:shopping_cart_flutter/src/presentation/cart/widgets/cart_content_item.dart';

class CartContent extends StatelessWidget {
  final CartState _cartState;

  const CartContent(this._cartState);

  @override
  Widget build(BuildContext context) {
    final totalPrice = () => Column(children: <Widget>[
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'total Price',
                style: Theme.of(context).textTheme.title,
              ),
              Text(_cartState.totalPrice,
                  style: Theme.of(context).textTheme.title)
            ],
          )
        ]);

    final cartItems = () => ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: _cartState.items.length + 1,
        itemBuilder: (context, index) {
          if (index < _cartState.items.length) {
            final CartItemState cartItemState = _cartState.items[index];

            return CartContentItem(cartItemState);
          } else {
            return totalPrice();
          }
        });

    final emptyCartItems = () => const Text(' Empty Cart :(');

    final content =
        _cartState.items.isNotEmpty ? cartItems() : emptyCartItems();

    return content;
  }
}
