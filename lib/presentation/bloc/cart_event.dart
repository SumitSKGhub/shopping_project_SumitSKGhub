import '../../data/models/product_model.dart';

abstract class CartEvent {}

class AddToCart extends CartEvent {
  final ProductModel product;
  AddToCart(this.product);
}

class RemoveFromCart extends CartEvent {
  final ProductModel product;
  RemoveFromCart(this.product);
}

class UpdateQuantity extends CartEvent {
  final ProductModel product;
  final int quantity;
  UpdateQuantity(this.product, this.quantity);
}
