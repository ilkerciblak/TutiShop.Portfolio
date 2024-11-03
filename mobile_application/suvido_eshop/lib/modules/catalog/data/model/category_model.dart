// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:suvido_eshop/modules/catalog/_catalog_feature_exporter.dart';

class CategoryModel {
  final int identifier;
  final String title;
  final String slug;

  CategoryModel({
    required this.identifier,
    required this.title,
    required this.slug,
  });

  CategoryModel copyWith({
    int? identifier,
    String? title,
    String? slug,
  }) {
    return CategoryModel(
      identifier: identifier ?? this.identifier,
      title: title ?? this.title,
      slug: slug ?? this.slug,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'identifier': identifier,
      'title': title,
      'slug': slug,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      identifier: map['identifier'] as int,
      title: map['title'] as String,
      slug: map['slug'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  Category toEntity() => Category(
        identifier: identifier,
        title: title,
        slug: slug,
      );

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;

    return other.identifier == identifier &&
        other.title == title &&
        other.slug == slug;
  }

  @override
  int get hashCode => identifier.hashCode ^ title.hashCode ^ slug.hashCode;
}
