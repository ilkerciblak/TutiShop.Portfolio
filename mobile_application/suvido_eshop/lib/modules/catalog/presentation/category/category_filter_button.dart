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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      selected: isSelected,
      onSelected: (value) {
        onSelected(category.slug);
      },
      side: BorderSide(
        color: primaryColor,
      ),
      selectedColor: primaryColor,
      backgroundColor: Colors.transparent,
      checkmarkColor: AppColors.primaryWhite,
      label: Text(
        category.title,
        style: isSelected
            ? AppFontStyles.boldWhite13.copyWith(fontSize: 13)
            : AppFontStyles.boldBlack13.copyWith(
                fontSize: 13,
              ),
      ),
    );
  }
}
