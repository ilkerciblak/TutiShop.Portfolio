import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:suvido_eshop/presentation/home/home_navigation_cubit.dart';
import 'package:suvido_eshop/presentation/home/shop/shop_screen.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class HomeNavigationScreen extends StatefulWidget {
  const HomeNavigationScreen({super.key});

  @override
  State<HomeNavigationScreen> createState() => _HomeNavigationScreenState();
}

class _HomeNavigationScreenState extends State<HomeNavigationScreen> {
  late HomeNavigationCubit cubit;

  @override
  void initState() {
    cubit = HomeNavigationCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeNavigationCubit, int>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          body: [
            const ShopScreen(),
            Container(),
            Container(),
          ][state],
          bottomNavigationBar: SalomonBottomBar(
            currentIndex: state,
            backgroundColor: AppColors.primaryBlack,
            selectedItemColor: AppColors.primaryWhite,
            unselectedItemColor: AppColors.primaryWhite.withOpacity(0.5),
            onTap: cubit.onNavTap,
            items: [
              SalomonBottomBarItem(
                icon: const Icon(Icons.shopping_bag),
                title: const Text('Shop'),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.shopping_cart),
                title: const Text('Basket'),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.person),
                title: const Text('Profile'),
              ),
            ],
          ),
        );
      },
    );
  }
}
