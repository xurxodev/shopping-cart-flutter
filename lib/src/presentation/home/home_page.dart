import 'package:flutter/material.dart';
import 'package:shopping_cart_flutter/src/presentation/cart/widgets/cart_drawer.dart';
import 'package:shopping_cart_flutter/src/presentation/home/my_app_bar.dart';
import 'package:shopping_cart_flutter/src/presentation/products/widgets/product_list.dart';

class HomePage extends StatelessWidget {
  final String searchTerm = 'Elements';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: <Widget>[
                    Text('Results for ',
                        style: Theme.of(context).textTheme.title),
                    Text(searchTerm,
                        style: Theme.of(context)
                            .textTheme
                            .title
                            .copyWith(color: Theme.of(context).primaryColor))
                  ],
                )),
            Expanded(
              child: ProductList(),
            )
          ],
        ),
      ),
      endDrawer:
          CartDrawer(),
    );
  }
}
