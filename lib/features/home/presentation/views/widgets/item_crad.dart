import 'package:dullany/core/functions/navigator.dart';
import 'package:dullany/core/router/app_router.dart';
import 'package:dullany/core/utls/app_colors.dart';
import 'package:dullany/core/utls/app_images.dart';
import 'package:dullany/core/utls/app_styles.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        customNavigate(context, kProductView);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.asset(Assets.assetsImagesRes2),
                ),
                SizedBox(height: 5),
                ListTile(
                  title: Text(
                    "مطعم الشام",
                    style: AppStyles.style16Bold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    'أشهى المأكولات الشامية واللحوم المشوية على الفحم',
                    style: AppStyles.style14Regular,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, size: 20, color: AppColors.rateColor),
                      Text(
                        '4.5',
                        style: AppStyles.style16Bold.copyWith(
                          color: AppColors.rateColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 8),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.primary,
                ),
                child: Text(
                  "مفتوح",
                  style: AppStyles.style12Regular.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
