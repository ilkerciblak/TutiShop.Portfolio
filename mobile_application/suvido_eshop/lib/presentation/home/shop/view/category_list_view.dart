import 'package:flutter/material.dart';
import 'package:suvido_eshop/modules/catalog/_catalog_feature_exporter.dart';
import 'package:suvido_eshop/modules/catalog/presentation/category/views/category_filter_loading.dart';
import 'package:suvido_eshop/presentation/home/shop/bloc/shop_screen_cubit.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class CategoryListView extends StatelessWidget {
  final ShopScreenCubit cubit;
  const CategoryListView({
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: buildComponent(),
      ),
    );
  }

  List<Widget> buildComponent() {
    return switch (cubit.state.categoryStatus) {
      FetchStatus.success => cubit.state.categoryList.indexed
          .map(
            (category) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: CategoryFilterButton(
                category: category.$2,
                onSelected: (categoryName) =>
                    cubit.onCategorySelected(categoryName, category.$1),
                isSelected: cubit.state.selectedCategory == category.$1,
              ),
            ),
          )
          .toList(),
      _ => List.generate(
          11,
          (index) => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 3),
            child: CategoryFilterLoading(),
          ),
        ),
    };
  }
}
