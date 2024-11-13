// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:suvido_eshop/modules/user/_user_module_exporter.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class UserPaymentMethodContainer extends StatelessWidget {
  final PaymentMethod method;
  const UserPaymentMethodContainer({
    super.key,
    required this.method,
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
            Text(
              method.cardNumber,
              style: AppFontStyles.regularBlack13,
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
            Text(
              method.cardType,
              style: AppFontStyles.regularBlack13,
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
            Text(
              method.cardExpire,
              style: AppFontStyles.regularBlack13,
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.small),
      ],
    );
  }
}
