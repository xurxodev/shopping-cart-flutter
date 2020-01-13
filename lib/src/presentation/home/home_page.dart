import 'package:flutter/material.dart';
import 'package:shopping_cart_flutter/src/presentation/home/my_app_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: const Center(child: Text('Product List')),
    );
  }
}
