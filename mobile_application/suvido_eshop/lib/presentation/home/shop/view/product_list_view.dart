// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:suvido_eshop/modules/catalog/presentation/_catalog_presentation_exporter.dart';
import 'package:suvido_eshop/presentation/home/shop/bloc/shop_screen_cubit.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class ProductListView extends StatelessWidget {
  final ShopScreenCubit cubit;
  const ProductListView({
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        childCount: cubit.state.productStatus.isSuccess
            ? cubit.state.productList.length
            : 10,
        (context, index) => switch (cubit.state.productStatus) {
          FetchStatus.success => cubit.state.productList
              .map((product) => ProductListComponent(product: product))
              .toList()[index],
          _ => const ProductListLoadingComponent()
        },
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 17,
        crossAxisSpacing: 17,
        childAspectRatio: .7,
      ),
    );
  }
}
