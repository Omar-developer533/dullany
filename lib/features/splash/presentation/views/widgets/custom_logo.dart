
import 'package:dullany/core/utls/app_colors.dart';
import 'package:dullany/core/utls/app_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: -300, end: 0),
      duration: Duration(seconds: 3),
      child: Text(
        'Dullany'.tr(),
        style: AppStyles.heading.copyWith(
          color: AppColors.white,
          fontSize: 64,
          fontFamily: 'Cairo',
        ),
      ),
      builder: (context, value, child) =>
          Transform.translate(offset: Offset(0, value), child: child),
    );
  }
}
