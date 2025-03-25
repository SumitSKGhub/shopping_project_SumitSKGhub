

class ProductModel{
  final int id;
  final String title;
  final String brand;
  final String thumbnail;
  final double price;
  final double discountPercentage;

  ProductModel({
    required this.id,
    required this.title,
    required this.brand,
    required this.thumbnail,
    required this.price,
    required this.discountPercentage,
});

  factory ProductModel.fromJson(Map<String, dynamic> json){
    return ProductModel(
        id: json['id'],
        title: json['title'],
        brand: json['brand'] ?? 'Unknown Brand',
        thumbnail: json['thumbnail'],
        price: (json['price'] as num).toDouble(),
        discountPercentage: (json['discountPercentage'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'title': title,
      'brand': brand,
      'thumbnail': thumbnail,
      'price': price,
      'discountPercentage': discountPercentage,
    };
  }

  double get discountedPrice => price - (price * discountPercentage / 100);

}