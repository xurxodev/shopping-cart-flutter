// Import the test package and Counter class
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_cart_flutter/src/domain/cart/Cart.dart';
import 'package:shopping_cart_flutter/src/domain/cart/CartItem.dart';

void main() {
  group('shopping cart', () {
    group('constructor', () {
      test(
          'should return totalPrice 0 and empty items if shopping cart is created using constructor with empty items',
              () {
            final shoppingCart = Cart([]);

            expect(shoppingCart.items, []);
            expect(shoppingCart.totalPrice, 0);
            expect(shoppingCart.totalItems, 0);
          });

      test(
          'should return totalPrice equal to item price and item if shopping cart is created using constructor with 1 item',
              () {
            final items = [givenAShoppingCartItem(1, 29.99)];
            final shoppingCart = Cart(items);

            expect(shoppingCart.items, items);
            expect(shoppingCart.totalPrice, 29.99);
            expect(shoppingCart.totalItems, 1);
          });

      test(
          'should return expected totalPrice and items if shopping cart is created using constructor with 2 items with quantity = 1',
              () {
            final items = [
              givenAShoppingCartItem(1, 29.99),
              givenAShoppingCartItem(1, 39.94)
            ];
            final shoppingCart = Cart(items);

            expect(shoppingCart.items, items);
            expect(shoppingCart.totalPrice, 69.93);
            expect(shoppingCart.totalItems, 2);
          });

      test(
          'should return expected totalPrice and items if shopping cart is created using constructor with 2 items witn quantity > 1',
              () {
            final items = [
              givenAShoppingCartItem(2, 29.99),
              givenAShoppingCartItem(5, 39.94)
            ];
            final shoppingCart = Cart(items);

            expect(shoppingCart.items, items);
            expect(shoppingCart.totalPrice, 259.68);
            expect(shoppingCart.totalItems, 7);
          });
    });

    group('createEmpty', () {
      test(
          'should return totalPrice 0 and empty items if shopping cart is created using create empty',
              () {
            final shoppingCart = Cart.createEmpty();

            expect(shoppingCart.items, []);
            expect(shoppingCart.totalPrice, 0);
            expect(shoppingCart.totalItems, 0);
          });
    });

    group('addItem', () {
      test(
          'should return expected totalPrice and items if item with quantity 1 is added',
              () {
            final items = [givenAShoppingCartItem(1, 29.99)];

            final shoppingCart = Cart(items);
            final newShoppingCart =
            shoppingCart.addItem(givenAShoppingCartItem(1, 39.94));

            expect(newShoppingCart.items.length, 2);
            expect(newShoppingCart.totalPrice, 69.93);
            expect(newShoppingCart.totalItems, 2);
          });

      test(
          'should return expected totalPrice and items if item with quantity > 1 is added',
              () {
            final items = [givenAShoppingCartItem(1, 29.99)];

            final shoppingCart = Cart(items);
            final newShoppingCart =
            shoppingCart.addItem(givenAShoppingCartItem(3, 39.94));

            expect(newShoppingCart.items.length, 2);
            expect(newShoppingCart.totalPrice, 149.81);
            expect(newShoppingCart.totalItems, 4);
          });

      test(
          'should increment quantity to existed item and totalPrice if add a existed item again',
              () {
            final items = [givenAShoppingCartItem(1, 29.99)];

            final shoppingCart = Cart(items);
            final newShoppingCart = shoppingCart.addItem(items[0]);

            expect(newShoppingCart.items.length, 1);
            expect(newShoppingCart.totalPrice, 59.98);
            expect(newShoppingCart.totalItems, 2);
          });
    });

    group('removeItem', () {
      test('should return totalPrice 0 and empty items if remove unique item',
              () {
            final items = [givenAShoppingCartItem(1, 29.99)];

            final shoppingCart = Cart(items);
            final newShoppingCart = shoppingCart.removeItem(items[0]);

            expect(newShoppingCart.items.length, 0);
            expect(newShoppingCart.totalPrice, 0);
            expect(newShoppingCart.totalItems, 0);
          });

      test('should return expected totalPrice and items if remove item', () {
        final items = [
          givenAShoppingCartItem(1, 29.99),
          givenAShoppingCartItem(5, 39.94)
        ];

        final shoppingCart = Cart(items);
        final newShoppingCart = shoppingCart.removeItem(items[1]);

        expect(newShoppingCart.items.length, 1);
        expect(newShoppingCart.totalPrice, 29.99);
        expect(newShoppingCart.totalItems, 1);
      });
    });


    group('editItem', () {
      test(
          'should return expected totalPrice and items if edit quantity to unique item', () {
        final items = [givenAShoppingCartItem(1, 29.99)];

        final shoppingCart = Cart(items);
        final newShoppingCart = shoppingCart.editItem(items[0],2);

        expect(newShoppingCart.items.length, 1);
        expect(newShoppingCart.totalPrice, 59.98);
        expect(newShoppingCart.totalItems, 2);
      });


      test(
          'should return expected totalPrice and items if edit quantity to a item', () {
        final items = [
          givenAShoppingCartItem(1, 29.99),
          givenAShoppingCartItem(5, 39.94)
        ];
        final shoppingCart = Cart(items);

        final newShoppingCart = shoppingCart.editItem(items[0], 2);

        expect(newShoppingCart.items.length, 2);
        expect(newShoppingCart.totalPrice, 259.68);
        expect(newShoppingCart.totalItems, 7);
      });
    });
  });
}

CartItem givenAShoppingCartItem([int quantity = 1, double price = 0]) {
  final Random random = Random();
  final int randomNumber = random.nextInt(100);

  return CartItem(
      randomNumber.toString(), 'Fake image', 'Fake title', price, quantity);
}
