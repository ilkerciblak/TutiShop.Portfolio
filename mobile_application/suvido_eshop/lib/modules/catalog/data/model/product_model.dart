import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:suvido_eshop/modules/catalog/domain/_catalog_domain_exporter.dart';

class ProductModel {
  final int identifier;
  final int categoryId;
  final String title;
  final String description;
  final String categoryName;
  final double price;
  final double rating;
  final int stock;
  final String thumbnail;
  final List<String> images;
  ProductModel({
    required this.identifier,
    required this.categoryId,
    required this.title,
    required this.description,
    required this.categoryName,
    required this.price,
    required this.rating,
    required this.stock,
    required this.thumbnail,
    required this.images,
  });

  ProductModel copyWith({
    int? identifier,
    int? categoryId,
    String? title,
    String? description,
    String? categoryName,
    double? price,
    double? rating,
    int? stock,
    String? thumbnail,
    List<String>? images,
  }) {
    return ProductModel(
      identifier: identifier ?? this.identifier,
      categoryId: categoryId ?? this.categoryId,
      title: title ?? this.title,
      description: description ?? this.description,
      categoryName: categoryName ?? this.categoryName,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      stock: stock ?? this.stock,
      thumbnail: thumbnail ?? this.thumbnail,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'identifier': identifier,
      'categoryId': categoryId,
      'title': title,
      'description': description,
      'categoryName': categoryName,
      'price': price,
      'rating': rating,
      'stock': stock,
      'thumbnail': thumbnail,
      'images': images,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      identifier: map['identifier'] as int,
      categoryId: map['categoryId'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      categoryName: map['categoryName'] as String,
      price: map['price'] as double,
      rating: map['rating'] as double,
      stock: map['stock'] as int,
      thumbnail: map['thumbnail'] as String,
      images: List<String>.from(
        (map['images'] as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  Product toEntity() {
    return Product(
      identifier: identifier,
      categoryId: categoryId,
      title: title,
      description: description,
      categoryName: categoryName,
      price: price,
      rating: rating,
      stock: stock,
      thumbnail: thumbnail,
      images: images,
    );
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.identifier == identifier &&
        other.categoryId == categoryId &&
        other.title == title &&
        other.description == description &&
        other.categoryName == categoryName &&
        other.price == price &&
        other.rating == rating &&
        other.stock == stock &&
        other.thumbnail == thumbnail &&
        listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return identifier.hashCode ^
        categoryId.hashCode ^
        title.hashCode ^
        description.hashCode ^
        categoryName.hashCode ^
        price.hashCode ^
        rating.hashCode ^
        stock.hashCode ^
        thumbnail.hashCode ^
        images.hashCode;
  }
}
