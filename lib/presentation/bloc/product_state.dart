import 'package:shopping_project/data/models/product_model.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<ProductModel> products;
  final bool hasMore;

  ProductLoaded({required this.products, required this.hasMore});
}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}
