// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:suvido_eshop/modules/catalog/domain/_catalog_domain_exporter.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';

class CategoryFilterButton extends StatelessWidget {
  final Category category;
  final Color primaryColor;
  final void Function(String categoryName) onSelected;
  final bool isSelected;

  const CategoryFilterButton({
    super.key,
    required this.category,
    this.primaryColor = AppColors.primaryBlack,
    required this.onSelected,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selected: false,
      onSelected: (value) {
        onSelected(category.slug);
      },
      side: BorderSide(
        color: primaryColor,
      ),
      selectedColor: primaryColor,
      labelStyle: AppFontStyles.boldWhite13.copyWith(
        fontSize: 9,
      ),
      backgroundColor: Colors.transparent,
      label: Text(
        category.title,
        style: AppFontStyles.boldBlack13.copyWith(
          fontSize: 9,
        ),
      ),
    );
  }
}
