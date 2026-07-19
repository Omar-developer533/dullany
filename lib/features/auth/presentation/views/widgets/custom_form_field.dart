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
    this.controller,
    this.obscureText = false,
    this.iconTap,
    this.fillColor,
    this.filled,
    this.borderColor,
    this.suffexText,
  });
 
  final Widget? suffexText;
  final Color? borderColor;
  final bool? filled;
  final Color? fillColor;
  final VoidCallback? iconTap;
  final TextEditingController? controller;
  final bool obscureText;
  final String hint;
  final IconData icon;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      keyboardType: textInputType,
      decoration: InputDecoration(
        filled: filled,
        fillColor: fillColor,
        hint: Text(
          hint.tr(),
          style: AppStyles.body.copyWith(color: AppColors.textPSecondary),
        ),
        suffixIcon:
            suffexText ??
            InkWell(
              onTap: iconTap,
              child: Icon(icon, color: AppColors.textPSecondary),
            ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? AppColors.textPSecondary,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? AppColors.textPSecondary,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
