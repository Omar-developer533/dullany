import 'package:dullany/core/utls/app_colors.dart';
import 'package:dullany/core/utls/app_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 3,
          shadowColor: AppColors.textPSecondary,
          toolbarHeight: 80,
          backgroundColor: AppColors.primary,
          title: Text(
            maxLines: 1,
            'Categories'.tr(),
            style: AppStyles.heading.copyWith(
              color: AppColors.background,
              fontSize: 33,
            ),
          ),
        ),
        backgroundColor: AppColors.background,
        body: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
       
          ],
        ),
      ),
    );
  }
}
