// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class ElevatedStatefullButton extends StatelessWidget {
  final String btnText;
  final void Function() onTap;
  final FetchStatus status;
  final Color? backgroundColor;
  final TextStyle? btnTextStyle;

  const ElevatedStatefullButton({
    super.key,
    required this.btnText,
    required this.onTap,
    required this.status,
    this.backgroundColor,
    this.btnTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: !status.isLoading ? onTap : null,
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: backgroundColor?.withOpacity(0.5) ??
            AppColors.primaryBlue.withOpacity(0.6),
        backgroundColor: backgroundColor ?? AppColors.primaryBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: !status.isLoading
          ? Text(
              btnText,
              style: btnTextStyle ?? AppFontStyles.boldWhite15,
            )
          : Row(
              children: [
                Expanded(
                  child: Text(
                    textAlign: TextAlign.center,
                    btnText,
                    style: btnTextStyle ?? AppFontStyles.boldWhite15,
                  ),
                ),
                const CircularProgressIndicator(
                  color: AppColors.primaryWhite,
                )
              ],
            ),
    );
  }
}
