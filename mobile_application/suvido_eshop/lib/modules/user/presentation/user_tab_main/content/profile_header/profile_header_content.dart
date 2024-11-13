// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:suvido_eshop/modules/user/domain/_user_domain_exporter.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class ProfileHeaderContent extends StatelessWidget {
  final User user;
  const ProfileHeaderContent({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
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
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: CachedNetworkImage(
            imageUrl: user.image,
            fadeInCurve: Easing.linear,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: AppSpacing.medium),
        Text(
          user.email,
          style: AppFontStyles.regularBlack11.withOpacity(0.8),
        ),
        Wrap(
          direction: Axis.horizontal,
          spacing: AppSpacing.small,
          children: [
            Text(
              user.firstName,
              style: AppFontStyles.boldBlack13,
            ),
            Text(
              user.lastName,
              style: AppFontStyles.boldBlack13,
            ),
          ],
        ),
      ],
    );
  }
}
