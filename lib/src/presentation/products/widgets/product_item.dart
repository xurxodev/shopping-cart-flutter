import 'package:flutter/material.dart';
import 'package:shopping_cart_flutter/src/presentation/products/products_state.dart';

class ProductItem extends StatelessWidget {
  final ProductItemState _productItem;

  final void Function(ProductItemState productItemState) _addProductToCartCallback;

  const ProductItem(this._productItem, this._addProductToCartCallback);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
        Expanded(
            flex: 5, // 60% of space => (6/(6 + 4))
            child: Image.network(
              _productItem.image,
              fit: BoxFit.fitWidth,
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            _productItem.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.body1,
          ),
        ),
        Text(_productItem.price, style: Theme.of(context).textTheme.headline),
        RawMaterialButton(
          child: Text(
            'Add to cart'.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .button
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          onPressed: ()=> _addProductToCartCallback(_productItem),
        )
      ],
    ));
  }
}
