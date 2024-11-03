import 'package:collection/collection.dart';
import 'package:suvido_eshop/modules/catalog/_catalog_feature_exporter.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class ShopScreenState {
  final List<Category> categoryList;
  final List<Product> productList;
  final FetchStatus categoryStatus;
  final FetchStatus productStatus;

  ShopScreenState(
      {required this.categoryList,
      required this.productList,
      required this.categoryStatus,
      required this.productStatus});

  ShopScreenState copyWith({
    List<Category>? categoryList,
    List<Product>? productList,
    FetchStatus? categoryStatus,
    FetchStatus? productStatus,
  }) {
    return ShopScreenState(
      categoryList: categoryList ?? this.categoryList,
      productList: productList ?? this.productList,
      categoryStatus: categoryStatus ?? this.categoryStatus,
      productStatus: productStatus ?? this.productStatus,
    );
  }

  factory ShopScreenState.initial() => ShopScreenState(
        categoryList: [],
        productList: [],
        categoryStatus: FetchStatus.idle,
        productStatus: FetchStatus.idle,
      );

  @override
  bool operator ==(covariant ShopScreenState other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return listEquals(other.categoryList, categoryList) &&
        listEquals(other.productList, productList) &&
        other.categoryStatus == categoryStatus &&
        other.productStatus == productStatus;
  }

  @override
  int get hashCode {
    return categoryList.hashCode ^
        productList.hashCode ^
        categoryStatus.hashCode ^
        productStatus.hashCode;
  }
}
