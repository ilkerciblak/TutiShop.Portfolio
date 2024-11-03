// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suvido_eshop/modules/catalog/_catalog_feature_exporter.dart';
import 'package:suvido_eshop/presentation/home/shop/bloc/shop_screen_cubit.dart';
import 'package:suvido_eshop/presentation/home/shop/bloc/shop_screen_state.dart';
import 'package:suvido_eshop/presentation/home/shop/view/_shop_view_exporter.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  late ShopScreenCubit cubit;

  @override
  void initState() {
    cubit = ShopScreenCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: false,
          floating: true,
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              Expanded(
                  child: Text(
                'Featured Shop',
                style: AppFontStyles.boldBlack21,
              ))
            ],
          ),
        ),
        BlocBuilder<ShopScreenCubit, ShopScreenState>(
          bloc: cubit,
          builder: (context, state) => SliverToBoxAdapter(
            child: CategoryListView(cubit: cubit),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 17, vertical: 17),
          sliver: BlocBuilder<ShopScreenCubit, ShopScreenState>(
            bloc: cubit,
            builder: (context, state) => SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: cubit.state.productList.length,
                (context, index) {
                  return cubit.state.productList
                      .map((product) => ProductListComponent(product: product))
                      .toList()[index];
                },
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 17,
                crossAxisSpacing: 17,
                childAspectRatio: .7,
              ),
            ),
          ),
        )
        // SliverGrid(
        //   delegate: SliverChildBuilderDelegate((context, index) {
        //     return Container();
        //   }),
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2,
        //   ),
        // )
      ],
    );
  }
}
