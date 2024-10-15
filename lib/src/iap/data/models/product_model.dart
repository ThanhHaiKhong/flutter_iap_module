import 'package:flutter_iap_module/src/iap/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    required super.rawPrice,
    required super.currencyCode,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      rawPrice: json['rawPrice'] as double,
      currencyCode: json['currencyCode'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'rawPrice': rawPrice,
      'currencyCode': currencyCode,
    };
  }
}