// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';
import 'package:suvido_eshop/modules/catalog/_catalog_feature_exporter.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class ShopScreenState {
  final List<Category> categoryList;
  final List<Product> productList;
  final int selectedCategory;
  final FetchStatus categoryStatus;
  final FetchStatus productStatus;

  ShopScreenState({
    required this.categoryList,
    required this.productList,
    required this.selectedCategory,
    required this.categoryStatus,
    required this.productStatus,
  });

  ShopScreenState copyWith({
    List<Category>? categoryList,
    List<Product>? productList,
    int? selectedCategory,
    FetchStatus? categoryStatus,
    FetchStatus? productStatus,
  }) {
    return ShopScreenState(
      categoryList: categoryList ?? this.categoryList,
      productList: productList ?? this.productList,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      categoryStatus: categoryStatus ?? this.categoryStatus,
      productStatus: productStatus ?? this.productStatus,
    );
  }

  factory ShopScreenState.initial() => ShopScreenState(
        categoryList: [],
        productList: [],
        categoryStatus: FetchStatus.idle,
        productStatus: FetchStatus.idle,
        selectedCategory: 0,
      );

  @override
  bool operator ==(covariant ShopScreenState other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return listEquals(other.categoryList, categoryList) &&
        listEquals(other.productList, productList) &&
        other.selectedCategory == selectedCategory &&
        other.categoryStatus == categoryStatus &&
        other.productStatus == productStatus;
  }

  @override
  int get hashCode {
    return categoryList.hashCode ^
        productList.hashCode ^
        selectedCategory.hashCode ^
        categoryStatus.hashCode ^
        productStatus.hashCode;
  }
}
