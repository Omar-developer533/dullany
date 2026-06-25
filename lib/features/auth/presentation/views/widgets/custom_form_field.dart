
import 'package:dullany/core/utls/app_colors.dart';
import 'package:dullany/core/utls/app_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.hint,
    required this.icon,
    this.textInputType,
    this.validator,
  });
  final String hint;
  final IconData icon;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hint: Text(
          hint.tr(),
          style: AppStyles.body.copyWith(color: AppColors.textPSecondary),
        ),
        suffixIcon: Icon(icon, color: AppColors.textPSecondary),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textPSecondary),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textPSecondary),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
