import 'package:flutter/material.dart';
import 'package:shopping_cart_flutter/src/presentation/products/products_state.dart';

class ProductItem extends StatelessWidget {
  final ProductItemState _product;

  const ProductItem(this._product);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
          Expanded(
          flex: 5, // 60% of space => (6/(6 + 4))
          child:
          Image.network(
          _product.image,
          fit: BoxFit.fitWidth,
        )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            _product.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.body1,
          ),
        ),
        Text(_product.price,
            style: Theme.of(context).textTheme.headline),
        RawMaterialButton(
            child: Text('Add to cart'.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: Theme.of(context).primaryColor)))
      ],
    ));
  }
}
