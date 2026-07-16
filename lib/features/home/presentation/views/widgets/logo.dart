
import 'package:dullany/core/utls/app_colors.dart';
import 'package:dullany/core/utls/app_images.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,

      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.background,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(Assets.assetsImagesLogo),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
