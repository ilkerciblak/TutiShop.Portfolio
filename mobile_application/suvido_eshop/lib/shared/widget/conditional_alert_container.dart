// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class ConditionalAlertContainer extends StatelessWidget {
  final String alertMessage;
  final bool condition;
  final bool success;
  final void Function()? iconOnTap;
  const ConditionalAlertContainer({
    super.key,
    required this.alertMessage,
    required this.condition,
    this.success = true,
    this.iconOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return condition
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: success
                  ? AppColors.primaryDarkGreen.withOpacity(0.4)
                  : Colors.red[400],
              border: Border.all(
                color: success ? AppColors.primaryDarkGreen : Colors.red,
              ),
              shape: BoxShape.rectangle,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    alertMessage,
                    style: AppFontStyles.boldWhite13,
                  ),
                ),
                IconButton(
                  onPressed: iconOnTap ?? () {},
                  icon: const Icon(Icons.close_outlined),
                )
              ],
            ))
        : Container();
  }
}
