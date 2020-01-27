import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_cart_flutter/src/presentation/cart/cart_state.dart';

class CartContentItem extends StatelessWidget {
  final CartItemState _cartItemState;
  final TextEditingController _quantityController = TextEditingController();

  CartContentItem(this._cartItemState);

  @override
  Widget build(BuildContext context) {
    _quantityController.text = _cartItemState.quantity.toString();

    final imageWidget = Image.network(
      _cartItemState.image,
      height: 120.0,
    );

    final descriptionWidget = Column(children: <Widget>[
      Text(
        _cartItemState.title,
        style: Theme.of(context).textTheme.subhead,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      Row(
        children: <Widget>[
          Expanded(
              child: TextField(
                  controller: _quantityController,
                  decoration: const InputDecoration(labelText: 'Quantity'),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly
              ])),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(_cartItemState.price,
                      style: Theme.of(context).textTheme.subhead))),
        ],
      )
    ]);

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, top: 16.0, right: 8.0, bottom: 16.0),
                      child: imageWidget)),
              Expanded(flex: 3, child: descriptionWidget),
              IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {},
              )
            ],
          ),
        ));
  }
}

/*
          ListTile(
            leading: Container(height: 200, width: 50, color: Colors.red,),
/*              leading:  Image.network(
                _cartItemState.image,

              )*/
            //title: Text(_cartItemState.title),
            title: Container(height: 200, width: 50, color: Colors.blue,),
            /*subtitle: Row(
              children: <Widget>[
                Expanded(
                    child: TextField(
                        controller: _quantityController,
                        //decoration: new InputDecoration(labelText: "Enter your number"),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ])),
                Expanded(
                    child: Text(_cartItemState.price,
                        style: Theme.of(context).textTheme.caption)),
              ],
            ),*/
            /*trailing: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {},
            ),*/
            trailing: Container(height: 200, width: 50, color: Colors.green,),
            //isThreeLine: true,
          ),
 */
