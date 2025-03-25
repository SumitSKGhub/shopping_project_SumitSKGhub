

import 'package:dio/dio.dart';
import 'package:shopping_project/data/models/product_model.dart';

class Product_Fetcher{
  final Dio _dio = Dio();

  Future<List<ProductModel>> fetchProducts(int page, int limit) async {
    final response = await _dio.get("https://dummyjson.com/products",queryParameters: {
      'limit': limit,
      'skip': page * limit,
    });

    if(response.statusCode == 200){
      List<ProductModel> products = (response.data['products'] as List)
        .map((json) => ProductModel.fromJson(json))
        .toList();
    return products;
  }
    else{
      throw Exception("Failed to load products");
    }
  }
}