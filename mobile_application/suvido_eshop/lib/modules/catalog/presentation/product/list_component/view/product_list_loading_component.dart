import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class ProductListLoadingComponent extends StatelessWidget {
  const ProductListLoadingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.primaryGrey,
      highlightColor: AppColors.primaryWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.primaryGrey,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 100, // Adjust width as needed
            height: 15,
            decoration: BoxDecoration(
              color: AppColors.primaryGrey,
              borderRadius: BorderRadius.circular(17),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            width: 50, // Adjust width as needed
            height: 12,
            decoration: BoxDecoration(
              color: AppColors.primaryGrey,
              borderRadius: BorderRadius.circular(17),
            ),
          ),
        ],
      ),
    );
  }
}
