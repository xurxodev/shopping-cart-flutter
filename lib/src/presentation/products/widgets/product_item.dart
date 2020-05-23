import 'package:flutter/material.dart';
import 'package:shopping_cart_flutter/src/common/bloc/bloc_provider.dart';
import 'package:shopping_cart_flutter/src/presentation/cart/cart_bloc.dart';
import 'package:shopping_cart_flutter/src/presentation/products/products_state.dart';

class ProductItem extends StatelessWidget {
  final ProductItemState _productItem;

  const ProductItem(this._productItem);

  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<CartBloc>(context);

    return Card(
        child: Column(
      children: <Widget>[
        Expanded(
            flex: 5,
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
          onPressed: ()=> cartBloc.addProductToCartCart(_productItem),
        )
      ],
    ));
  }
}
