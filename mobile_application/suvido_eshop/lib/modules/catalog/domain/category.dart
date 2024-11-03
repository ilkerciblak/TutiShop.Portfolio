class Category {
  final int identifier;
  final String title;
  final String slug;

  Category({
    required this.identifier,
    required this.title,
    required this.slug,
  });

  Category copyWith({
    int? identifier,
    String? title,
    String? slug,
  }) {
    return Category(
      identifier: identifier ?? this.identifier,
      title: title ?? this.title,
      slug: slug ?? this.slug,
    );
  }

  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) return true;

    return other.identifier == identifier &&
        other.title == title &&
        other.slug == slug;
  }

  @override
  int get hashCode => identifier.hashCode ^ title.hashCode ^ slug.hashCode;
}
