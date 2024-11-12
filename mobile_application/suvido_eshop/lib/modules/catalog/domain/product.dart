import 'package:collection/collection.dart';
import 'package:suvido_eshop/modules/catalog/domain/review.dart';

class Product {
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
  final List<Review> reviews;

  Product({
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
    required this.reviews,
  });

  factory Product.def() => Product(
        identifier: 0,
        categoryId: 0,
        title: '0',
        description: '0',
        categoryName: '0',
        price: 0,
        rating: 0,
        stock: 0,
        thumbnail: '',
        images: List.empty(),
        reviews: List.empty(),
      );

  Product copyWith({
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
    List<Review>? reviews,
  }) {
    return Product(
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
      reviews: reviews ?? this.reviews,
    );
  }

  @override
  bool operator ==(covariant Product other) {
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
        listEquals(other.images, images) &&
        listEquals(other.reviews, reviews);
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
        images.hashCode ^
        reviews.hashCode;
  }
}
