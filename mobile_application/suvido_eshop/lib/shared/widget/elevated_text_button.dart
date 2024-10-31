// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:suvido_eshop/shared/theme/_shared_app_theme_exporter.dart';

class ElevatedTextButton extends StatelessWidget {
  final String btnText;
  final void Function() onPressed;
  final Color? backgroundColor;
  final TextStyle? btnTextStyle;
  const ElevatedTextButton({
    super.key,
    required this.btnText,
    required this.onPressed,
    this.backgroundColor,
    this.btnTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.primaryLightGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        btnText,
        style: AppFontStyles.boldWhite15,
      ),
    );
  }
}
