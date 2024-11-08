import 'package:get_it/get_it.dart';
import 'package:suvido_eshop/modules/catalog/_catalog_feature_exporter.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';
import 'package:suvido_eshop/shared/config/init_shared_services.dart';

final getIt = GetIt.instance;

Future<void> initProject() async {
  await initSharedServices();

  getIt.registerSingleton<ProductService>(
    ProductService(
      api: getIt<DummyJsonApi>(),
    ),
  );

  getIt.registerSingleton<CategoryService>(
    CategoryService(
      api: getIt<DummyJsonApi>(),
    ),
  );

  getIt.registerSingleton<IProductRepository>(
    ProductRepository(
      productService: getIt<ProductService>(),
    ),
  );
  getIt.registerSingleton<ICategoryRepository>(
    CategoryRepository(
      categoryService: getIt<CategoryService>(),
    ),
  );

  await getIt.allReady();
}
