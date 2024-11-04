import 'package:flutter/material.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';
import 'package:shimmer/shimmer.dart';

class CategoryFilterLoading extends StatelessWidget {
  final Color shimmerBaseColor;
  final Color shimmerHighlightColor;

  const CategoryFilterLoading({
    super.key,
    this.shimmerBaseColor = AppColors.primaryGrey,
    this.shimmerHighlightColor = AppColors.primaryWhite,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: shimmerBaseColor,
      highlightColor: shimmerHighlightColor,
      child: ChoiceChip(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        selected: false,
        onSelected: (value) {},
        side: BorderSide(
          color: shimmerBaseColor,
        ),
        backgroundColor: Colors.transparent,
        label: Text(
          'Category',
          style: AppFontStyles.boldWhite13.copyWith(fontSize: 13),
        ),
      ),
    );
  }
}
