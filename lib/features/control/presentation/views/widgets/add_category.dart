
import 'package:dullany/core/utls/app_colors.dart';
import 'package:dullany/core/utls/app_styles.dart';
import 'package:dullany/core/widgets/custom_button.dart';
import 'package:dullany/features/auth/presentation/views/widgets/custom_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddCategory extends StatelessWidget {
  const AddCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.add_circle_outline_rounded, color: AppColors.primary),
            SizedBox(width: 5),
            Text('Add New Category'.tr(), style: AppStyles.style18Bold),
          ],
        ),
        SizedBox(height: 16),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.white,
            border: Border.all(color: AppColors.primary),
          ),
          child: Column(
            children: [
              CustomFormField(
                borderColor: Colors.transparent,
                filled: true,
                fillColor: AppColors.fillTextField,
                hint: 'Category Name',
                icon: Icons.category,
              ),
              SizedBox(height: 16),
              CustomFormField(
                borderColor: Colors.transparent,
                filled: true,
                fillColor: AppColors.fillTextField,
                hint: 'Description',
                icon: Icons.description,
              ),
              SizedBox(height: 16),
              CustomFormField(
                borderColor: Colors.transparent,
                filled: true,
                fillColor: AppColors.fillTextField,
                hint: 'Image',
                icon: Icons.image,
              ),
              SizedBox(height: 16),
              CustomButton(name: 'Add'),
            ],
          ),
        ),
      ],
    );
  }
}
