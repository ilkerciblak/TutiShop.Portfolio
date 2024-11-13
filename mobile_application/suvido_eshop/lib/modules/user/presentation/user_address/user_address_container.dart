// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:suvido_eshop/modules/user/_user_module_exporter.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class UserAddressContainer extends StatelessWidget {
  final Address address;
  const UserAddressContainer({
    super.key,
    required this.address,
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
              'Address',
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
              'Country:',
              style: AppFontStyles.boldBlack13.withOpacity(0.6),
            ),
            Text(
              address.country,
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
              'City:',
              style: AppFontStyles.boldBlack13.withOpacity(0.6),
            ),
            Text(
              address.city,
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
              'State:',
              style: AppFontStyles.boldBlack13.withOpacity(0.6),
            ),
            Text(
              address.state,
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
              'Address:',
              style: AppFontStyles.boldBlack13.withOpacity(0.6),
            ),
            Text(
              address.address,
              style: AppFontStyles.regularBlack13,
            ),
          ],
        ),
      ],
    );
  }
}
