import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class ProfileHeaderLoadingContent extends StatelessWidget {
  const ProfileHeaderLoadingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.primaryGrey,
      highlightColor: AppColors.primaryWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.logout,
                ),
              )
            ],
          ),
          Container(
            height: 100,
            decoration: const BoxDecoration(
              color: AppColors.primaryGrey,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(height: AppSpacing.medium),
          Container(
            width: 200,
            height: 13,
            decoration: BoxDecoration(
                color: AppColors.primaryGrey,
                borderRadius: BorderRadius.circular(8)),
          ),
          const SizedBox(height: AppSpacing.small),
          Wrap(
            direction: Axis.horizontal,
            spacing: AppSpacing.small,
            children: [
              Container(
                width: 40,
                height: 13,
                decoration: BoxDecoration(
                  color: AppColors.primaryGrey,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Container(
                width: 40,
                height: 13,
                decoration: BoxDecoration(
                  color: AppColors.primaryGrey,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
