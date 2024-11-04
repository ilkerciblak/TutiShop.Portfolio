import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:suvido_eshop/modules/catalog/domain/_catalog_domain_exporter.dart';
import 'package:suvido_eshop/modules/catalog/presentation/product/detail_screen/bloc/product_detail_state.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  final int productId;
  final IProductRepository productRepository =
      GetIt.instance<IProductRepository>();

  ProductDetailCubit({
    required this.productId,
  }) : super(
          ProductDetailState.initial(),
        ) {
    getProduct();
  }

  void getProduct() async {
    emit(state.copyWith(fetchStatus: FetchStatus.loading));

    var response = await productRepository
        .getSingleProduct(productId: productId.toString())
        .run();

    response.fold(
      (l) {
        emit(
          state.copyWith(
            fetchStatus: FetchStatus.failed,
            errorMessage: (l as NetworkException).toString(),
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            fetchStatus: FetchStatus.success,
            product: r,
          ),
        );
      },
    );
  }
}
