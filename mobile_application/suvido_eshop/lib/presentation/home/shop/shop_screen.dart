// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
