import 'package:flutter/material.dart';
import 'package:suvido_eshop/modules/catalog/domain/_catalog_domain_exporter.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

class ProductListComponent extends StatelessWidget {
  final Product product;
  const ProductListComponent({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed('product-detail',
            pathParameters: {'id': '${product.identifier}'});
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.imgBackground,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: product.images.first,
                    fadeInCurve: Easing.linear,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const Positioned(
                top: 8,
                right: 8,
                child: Icon(
                  Icons.favorite_border,
                  color: AppColors.primaryBlack,
                ),
              ),
            ],
          ),
          Text(
            product.title,
            style: AppFontStyles.boldBlack13,
          ),
          Text(
            '\$ ${product.price}',
            style: AppFontStyles.boldBlack13.copyWith(fontSize: 11),
          )
        ],
      ),
    );
  }
}
