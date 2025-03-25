

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_project/data/fetch/product_fetch.dart';
import 'package:shopping_project/data/models/product_model.dart';
import 'package:shopping_project/presentation/bloc/product_event.dart';
import 'package:shopping_project/presentation/bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final Product_Fetcher productFetcher;
  int _currentPage = 0;
  bool _hasMore = true;
  List<ProductModel> _allProducts = [];

  int get currentPage => _currentPage;

  ProductBloc({required this.productFetcher}) : super(ProductInitial()) {
    on<LoadProducts>((event, emit) async {
      if (!_hasMore) return;

      try {
        if (_currentPage == 0) {
          emit(ProductLoading());
        }

        final newProducts = await productFetcher.fetchProducts(_currentPage, event.limit);
        _hasMore = newProducts.isNotEmpty;

        _allProducts.addAll(newProducts);
        _currentPage++;

        emit(ProductLoaded(products: _allProducts, hasMore: _hasMore));
      } catch (e) {
        emit(ProductError("Failed to load products"));
      }
    });
  }
}
