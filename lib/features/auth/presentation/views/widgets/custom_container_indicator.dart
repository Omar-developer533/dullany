import 'package:dullany/core/utls/app_colors.dart';
import 'package:flutter/material.dart';

class CustomContainerIndicator extends StatelessWidget {
  const CustomContainerIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: CircularProgressIndicator(
          padding: EdgeInsets.all(0),
          color: AppColors.white,
          strokeWidth: 2,
        ),
      ),
    );
  }
}
