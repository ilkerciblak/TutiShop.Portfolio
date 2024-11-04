import 'package:suvido_eshop/modules/catalog/domain/_catalog_domain_exporter.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class ProductDetailState {
  final Product product;
  final FetchStatus fetchStatus;
  final String errorMessage;

  ProductDetailState({
    required this.product,
    required this.fetchStatus,
    required this.errorMessage,
  });

  factory ProductDetailState.initial() => ProductDetailState(
        product: Product.def(),
        fetchStatus: FetchStatus.idle,
        errorMessage: '',
      );

  ProductDetailState copyWith({
    Product? product,
    FetchStatus? fetchStatus,
    String? errorMessage,
  }) {
    return ProductDetailState(
      product: product ?? this.product,
      fetchStatus: fetchStatus ?? this.fetchStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  bool operator ==(covariant ProductDetailState other) {
    if (identical(this, other)) return true;

    return other.product == product &&
        other.fetchStatus == fetchStatus &&
        other.errorMessage == errorMessage;
  }

  @override
  int get hashCode =>
      product.hashCode ^ fetchStatus.hashCode ^ errorMessage.hashCode;
}
