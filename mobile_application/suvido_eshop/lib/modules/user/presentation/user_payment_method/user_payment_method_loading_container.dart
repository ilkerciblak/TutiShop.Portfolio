// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class UserPaymentMethodLoadingContainer extends StatelessWidget {
  const UserPaymentMethodLoadingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            Expanded(
                child: Text(
              'Payment Method',
              style: AppFontStyles.boldBlack15.withOpacity(0.6),
            ))
          ],
        ),
        const SizedBox(height: AppSpacing.small),
        Wrap(
          direction: Axis.horizontal,
          spacing: AppSpacing.medium,
          children: [
            Text(
              'Card Number:',
              style: AppFontStyles.boldBlack13.withOpacity(0.6),
            ),
            Shimmer.fromColors(
              baseColor: AppColors.primaryGrey,
              highlightColor: AppColors.primaryWhite,
              child: Container(
                width: 80,
                height: 13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.primaryBlue,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.small),
        Wrap(
          direction: Axis.horizontal,
          spacing: AppSpacing.medium,
          children: [
            Text(
              'Card Type:',
              style: AppFontStyles.boldBlack13.withOpacity(0.6),
            ),
            Shimmer.fromColors(
              baseColor: AppColors.primaryGrey,
              highlightColor: AppColors.primaryWhite,
              child: Container(
                width: 80,
                height: 13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.primaryBlue,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.small),
        Wrap(
          direction: Axis.horizontal,
          spacing: AppSpacing.medium,
          children: [
            Text(
              'Expire:',
              style: AppFontStyles.boldBlack13.withOpacity(0.6),
            ),
            Shimmer.fromColors(
              baseColor: AppColors.primaryGrey,
              highlightColor: AppColors.primaryWhite,
              child: Container(
                width: 80,
                height: 13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.primaryBlue,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.small),
      ],
    );
  }
}
