import 'package:flutter/material.dart';
import 'package:shopping_cart_flutter/src/presentation/cart/widgets/cart_counter_badge.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar() : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

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
    // Using Stack to show Notification Badge
    return Stack(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
        CartCounterBadge()
      ],
    );
  }
}
