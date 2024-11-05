import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suvido_eshop/modules/catalog/presentation/product/detail_screen/bloc/_product_detail_bloc_exporter.dart';
import 'package:suvido_eshop/modules/catalog/presentation/product/detail_screen/view/_product_detail_view_exporter.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class ProductDetailScreen extends StatefulWidget {
  final int productId;
  const ProductDetailScreen({
    super.key,
    required this.productId,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late ProductDetailCubit cubit;

  @override
  void initState() {
    cubit = ProductDetailCubit(productId: widget.productId);
    super.initState();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: SafeArea(
        child: BlocBuilder<ProductDetailCubit, ProductDetailState>(
          bloc: cubit,
          builder: (context, state) {
            switch (state.fetchStatus) {
              case FetchStatus.success:
                return CustomScrollView(
                  slivers: [
                    SliverPersistentHeader(
                      delegate: ProductImageHeaderDelegate(
                        maxExtent: 400,
                        minExtent: 150,
                        imgUrl: cubit.state.product.images,
                      ),
                      pinned: false,
                      floating: false,
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 11),
                      sliver: SliverToBoxAdapter(
                        child: ProductDetailContainer(
                          product: cubit.state.product,
                        ),
                      ),
                    ),
                  ],
                );

              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
