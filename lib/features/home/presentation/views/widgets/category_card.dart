import 'package:dullany/core/functions/navigator.dart';
import 'package:dullany/core/router/app_router.dart';
import 'package:dullany/core/utls/app_colors.dart';
import 'package:dullany/core/utls/app_styles.dart';
import 'package:dullany/features/home/data/models/category_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        customNavigate(context, kItemsView);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.asset(categoryModel.image, fit: BoxFit.fill),
              ),
            ),
            SizedBox(height: 16),
            Text(categoryModel.categoryName.tr(), style: AppStyles.style18Bold),

            Text(
              categoryModel.describtion.tr(),
              style: AppStyles.style12Regular,
            ),
            SizedBox(height: 17),
          ],
        ),
      ),
    );
  }
}
