// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:suvido_eshop/modules/catalog/domain/_catalog_domain_exporter.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductListComponent extends StatelessWidget {
  final Product product;
  const ProductListComponent({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFF5F5F5),
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
    );
  }
}
