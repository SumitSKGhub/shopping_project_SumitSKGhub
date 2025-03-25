

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_project/data/fetch/product_fetch.dart';
import 'package:shopping_project/data/models/product_model.dart';
import 'package:shopping_project/presentation/bloc/product_event.dart';
import 'package:shopping_project/presentation/bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final Product_Fetcher _data = Product_Fetcher();
  List<ProductModel> _allProducts = [];
  bool _hasMore = true;
  int _currentPage = 0;
  final int _limit = 50;

  ProductBloc() : super(ProductInitial()){
    on<LoadProducts>(_onLoadProducts);
  }

  Future<void> _onLoadProducts(LoadProducts event, Emitter<ProductState> emit) async {
    if(!_hasMore) return;

    emit(ProductLoading());

    try {
      final products = await _data.fetchProducts(_currentPage, _limit);
      _allProducts.addAll(products);
      _hasMore = products.length == _limit;
      _currentPage++;

      emit(ProductLoaded(products: _allProducts, hasMore: _hasMore));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}