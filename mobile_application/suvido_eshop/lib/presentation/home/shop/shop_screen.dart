import 'package:flutter/widgets.dart';
import 'package:suvido_eshop/presentation/home/shop/bloc/shop_screen_cubit.dart';

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
    return const Placeholder();
  }
}
