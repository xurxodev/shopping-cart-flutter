import 'package:flutter/material.dart';
import 'package:shopping_cart_flutter/dependencies_provider.dart' as di;
import 'package:shopping_cart_flutter/src/presentation/app.dart';

void main() {
  di.init();

  runApp(App());
}

