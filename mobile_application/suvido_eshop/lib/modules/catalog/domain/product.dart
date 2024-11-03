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
  final String images;

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
  });

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
    String? images,
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
    );
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.identifier == identifier &&
        other.categoryId == categoryId &&
        other.title == title &&
        other.description == description &&
        other.categoryName == categoryName &&
        other.price == price &&
        other.rating == rating &&
        other.stock == stock &&
        other.thumbnail == thumbnail &&
        other.images == images;
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
