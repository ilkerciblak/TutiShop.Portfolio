import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:suvido_eshop/modules/catalog/_catalog_feature_exporter.dart';
import 'package:suvido_eshop/presentation/home/shop/bloc/shop_screen_state.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class ShopScreenCubit extends Cubit<ShopScreenState> {
  final IProductRepository productRepository =
      GetIt.instance<IProductRepository>();

  final ICategoryRepository categoryRepository =
      GetIt.instance<ICategoryRepository>();

  ShopScreenCubit()
      : super(
          ShopScreenState.initial(),
        ) {
    initPage();
  }

  void initPage() {
    getCategories();
  }

  void getCategories() async {
    emit(
      state.copyWith(
        categoryStatus: FetchStatus.loading,
      ),
    );

    var response = await categoryRepository.getCategories().run();

    response.fold(
      (l) {
        print(l);
      },
      (categoryList) {
        emit(
          state.copyWith(
            categoryStatus: FetchStatus.success,
            categoryList: categoryList,
          ),
        );
      },
    );
  }

  void getProducts() {
    emit(
      state.copyWith(
        productStatus: FetchStatus.loading,
      ),
    );
  }

  void onCategorySelected(String slug, int index) {
    emit(state.copyWith(
      selectedCategory: index,
    ));
  }
}
