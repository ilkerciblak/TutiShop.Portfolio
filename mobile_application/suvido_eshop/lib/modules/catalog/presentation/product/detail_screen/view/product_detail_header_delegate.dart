import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:suvido_eshop/modules/catalog/presentation/product/detail_screen/view/product_detail_header_content.dart';

class ProductImageHeaderDelegate implements SliverPersistentHeaderDelegate {
  @override
  final double maxExtent;
  @override
  final double minExtent;
  final List<String> imgUrl;

  ProductImageHeaderDelegate({
    required this.maxExtent,
    required this.minExtent,
    required this.imgUrl,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ProductDetailHeaderContent(imgUrl: imgUrl);
  }

  double titleOpacity(double shrinkOffset) {
    // simple formula: fade out text as soon as shrinkOffset > 0
    return 1.0 - max(0.0, shrinkOffset) / maxExtent;
    // more complex formula: starts fading out text when shrinkOffset > minExtent
    //return 1.0 - max(0.0, (shrinkOffset - minExtent)) / (maxExtent - minExtent);
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration =>
      FloatingHeaderSnapConfiguration();

  @override
  // TODO: implement showOnScreenConfiguration
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration =>
      null;

  @override
  // TODO: implement stretchConfiguration
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  // TODO: implement vsync
  TickerProvider? get vsync => null;
}
