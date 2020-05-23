import 'package:flutter/material.dart';
import 'package:shopping_cart_flutter/src/common/bloc/bloc_provider.dart';
import 'package:shopping_cart_flutter/src/presentation/cart/cart_bloc.dart';
import 'package:shopping_cart_flutter/src/presentation/cart/cart_state.dart';

class CartCounterBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<CartBloc>(context);

    return StreamBuilder<CartState>(
        initialData: cartBloc.state,
        stream: cartBloc.observableState,
        builder: (context, snapshot) {
          final state = snapshot.data;

          if (state is LoadedCartState) {
            return state.totalItems > 0
                ? _renderCounterBadge(state.totalItems)
                : Container();
          } else
            return Container();
        });
  }

  Widget _renderCounterBadge(int totalItems) {
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
          '$totalItems',
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