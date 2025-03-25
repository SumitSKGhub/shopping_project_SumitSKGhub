import '../../data/models/product_model.dart';

class CartState {
  final Map<ProductModel, int> cartItems;

  CartState({required this.cartItems});

  double get totalPrice => cartItems.entries
      .map((entry) => entry.key.discountedPrice * entry.value)
      .fold(0, (sum, item) => sum + item);

  int get noofItems => cartItems.values.fold(0, (sum, quantity) => sum + quantity);

}
