// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:suvido_eshop/modules/catalog/domain/_catalog_domain_exporter.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class ProductDetailContainer extends StatelessWidget {
  final Product product;

  const ProductDetailContainer({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(17)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title,
            style: AppFontStyles.boldBlack21,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.star, color: AppColors.primaryBlack, size: 20),
              Text(
                "${product.rating}",
                style: AppFontStyles.boldBlack13,
              ),
              const SizedBox(width: AppSpacing.small),
              Text("(${product.stock * 13} reviews)"),
              const Spacer(),
              Text(
                "${product.stock} in stock",
                style: AppFontStyles.boldBlack13,
              ),
              const SizedBox(width: AppSpacing.small),
            ],
          ),
          const Row(
            children: [Expanded(child: Divider())],
          ),
          const SizedBox(height: AppSpacing.small),
          const Text(
            'Description',
            style: AppFontStyles.boldBlack18,
          ),
          const SizedBox(height: AppSpacing.small),
          Text(
            product.description,
            style: AppFontStyles.regularBlack15,
          ),
        ],
      ),
    );
  }
}
