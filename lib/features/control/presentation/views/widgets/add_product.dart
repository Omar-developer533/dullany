import 'package:dullany/core/utls/app_colors.dart';
import 'package:dullany/core/utls/app_styles.dart';
import 'package:dullany/core/widgets/custom_button.dart';
import 'package:dullany/features/auth/presentation/views/widgets/custom_form_field.dart';
import 'package:dullany/features/control/presentation/views/widgets/custom_label.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.add_circle_outline_rounded, color: AppColors.primary),
            SizedBox(width: 5),
            Text('Add New Product'.tr(), style: AppStyles.style18Bold),
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
              CustomLabel(labelName: 'اسم المنتج'),
              SizedBox(height: 4),
              CustomFormField(
                borderColor: Colors.transparent,
                filled: true,
                fillColor: AppColors.fillTextField,
                hint: ' ',
                icon: Icons.local_offer,
              ),
              SizedBox(height: 16),
              CustomLabel(labelName: 'السعر'),
              SizedBox(height: 4),
              CustomFormField(
                borderColor: Colors.transparent,
                filled: true,
                fillColor: AppColors.fillTextField,
                hint: '0.00',
                suffexText: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text('ل.س', style: AppStyles.style16Regular),
                ),
                icon: Icons.price_change,
              ),
              SizedBox(height: 16),
              CustomLabel(labelName: 'الوصف'),
              SizedBox(height: 4),
              CustomFormField(
                borderColor: Colors.transparent,
                filled: true,
                fillColor: AppColors.fillTextField,
                hint: 'اكتب وصف جذاب لمنتجك',
                icon: Icons.description,
              ),
              SizedBox(height: 16),
              CustomLabel(labelName: 'صورة المنتج'),
              CustomFormField(
                borderColor: Colors.transparent,
                filled: true,
                fillColor: AppColors.fillTextField,
                hint: 'انقر لرفع صورة المنتج',
                icon: Icons.image,
              ),
              SizedBox(height: 20),
              CustomButton(name: 'Add'),
            ],
          ),
        ),
      ],
    );
    
  }
}
