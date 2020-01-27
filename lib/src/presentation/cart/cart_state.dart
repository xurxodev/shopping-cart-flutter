class CartState {
  final String totalPrice;
  final int totalItems;
  final List<CartItemState> items;

  CartState(this.totalPrice, this.totalItems, this.items);

  factory CartState.createEmpty() {
    return CartState('0 €', 0, []);
  }
}

class CartItemState {
  final String id;
  final String image;
  final String title;
  final String price;
  final int quantity;

  CartItemState(this.id, this.image, this.title, this.price, this.quantity);
}
