import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int _cartItemsCounter;

  MyAppBar(this._cartItemsCounter, {Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; //

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        'assets/images/logo.png',
        width: 130.0,
      ),
      actions: <Widget>[
        shoppingCartIcon(context)
      ],
    );
  }

  Widget shoppingCartIcon(BuildContext context) {
    final badge = _cartItemsCounter != 0 ? counterBadge() : Container();

    // Using Stack to show Notification Badge
    return Stack(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
        badge
      ],
    );
  }

  Widget counterBadge() {
    return Positioned(
      right: 5,
      top: 5,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        constraints: const BoxConstraints(
          minWidth: 18,
          minHeight: 18,
        ),
        child: Text(
          '$_cartItemsCounter',
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
