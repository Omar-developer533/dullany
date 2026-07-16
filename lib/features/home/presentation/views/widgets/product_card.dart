import 'package:dullany/core/utls/app_colors.dart';
import 'package:dullany/core/utls/app_images.dart';
import 'package:dullany/core/utls/app_styles.dart';
import 'package:dullany/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              Assets.assetsImagesResturant2,
              width: double.infinity,
              height: 100,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text('شاورما عربي', style: AppStyles.style18Bold),
                  ),
                  SizedBox(height: 8),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'سندويتش مع ثوم وسرفيس',
                      style: AppStyles.style14Regular,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(height: 8),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'السعر : 220 ل.س',
                      maxLines: 1,
                      style: AppStyles.style18Bold.copyWith(
                        color: AppColors.primary,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomButton(name: 'Add to cart'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
