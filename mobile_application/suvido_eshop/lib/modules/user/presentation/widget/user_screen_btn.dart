// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class UserScreenBtn extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;
  final String btnText;
  const UserScreenBtn({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          overlayColor: AppColors.primaryWhite,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.primaryBlack.withOpacity(0.8),
              size: 27,
            ),
            const SizedBox(width: AppSpacing.medium),
            Text(
              btnText,
              style: AppFontStyles.boldBlack15.withOpacity(0.8),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward,
              color: AppColors.primaryBlack.withOpacity(0.8),
            )
          ],
        ));
  }
}
