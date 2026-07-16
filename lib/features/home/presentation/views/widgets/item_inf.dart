
import 'package:dullany/core/utls/app_colors.dart';
import 'package:dullany/core/utls/app_styles.dart';
import 'package:flutter/material.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'مطعم الشام',
            style: AppStyles.style18Bold.copyWith(fontSize: 22),
            maxLines: 1,
          ),
          SizedBox(height: 8),
          Text(
            'دمشق _طريق المطار_الجسر الخامس',
            style: AppStyles.style14Regular,
            maxLines: 2,
          ),
          SizedBox(height: 8),
          Text(
            'تواصل معنا :',
            style: AppStyles.style18Bold.copyWith(
              color: AppColors.primary,
              fontSize: 22,
            ),
            maxLines: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('0984580143', style: AppStyles.style18Bold),
              SizedBox(width: 6),
              Icon(Icons.phone_android, color: AppColors.primary, size: 24),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('0117234580', style: AppStyles.style18Bold),
              SizedBox(width: 6),
              Icon(Icons.phone, color: AppColors.primary, size: 24),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
