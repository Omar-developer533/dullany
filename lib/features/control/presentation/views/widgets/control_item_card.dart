import 'package:dullany/core/utls/app_colors.dart';
import 'package:dullany/core/utls/app_images.dart';
import 'package:dullany/core/utls/app_styles.dart';
import 'package:flutter/material.dart';

class ControlItemCard extends StatelessWidget {
  const ControlItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.primary),
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      child: ListTile(
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(Assets.assetsImagesDamasRes),
            ),
          ),
        ),
        title: Text(
          "مطعم الشام",
          style: AppStyles.style16Bold,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          'الرياض-حي النخيل',
          style: AppStyles.style14Regular,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.delete_sharp, size: 28),
        ),
      ),
    );
  }
}
