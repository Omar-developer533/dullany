import 'package:dullany/core/utls/app_colors.dart';
import 'package:dullany/core/utls/app_styles.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, required this.hintText});
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      leading: Icon(Icons.search),
      hintStyle: WidgetStateProperty.all(AppStyles.style14Regular),
      hintText: hintText,
      elevation: WidgetStateProperty.all(0),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: AppColors.borderColor),
        ),
      ),
      backgroundColor: WidgetStateProperty.all(AppColors.background),
    );
  }
}
