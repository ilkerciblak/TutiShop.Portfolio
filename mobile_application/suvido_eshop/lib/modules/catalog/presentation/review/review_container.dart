import 'package:flutter/material.dart';
import 'package:suvido_eshop/modules/catalog/domain/review.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class ReviewContainer extends StatelessWidget {
  final Review review;
  const ReviewContainer({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              review.username,
              style: AppFontStyles.boldBlack11,
            ),
            const SizedBox(width: AppSpacing.small),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  color: AppColors.primaryBlack,
                  size: 13,
                ),
                Text(
                  "${review.rating}",
                  style: AppFontStyles.boldBlack11,
                ),
              ],
            ),
            const Spacer(),
            Text(
              review.date.toShortDate,
              style: AppFontStyles.regularBlack11,
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.small),
        Text(
          review.comment,
          style: AppFontStyles.regularBlack15,
          softWrap: true,
          overflow: TextOverflow.clip,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
