import 'package:dullany/core/utls/app_colors.dart';
import 'package:dullany/core/utls/app_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void customSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message.tr(),
        style: AppStyles.body.copyWith(color: AppColors.background),
      ),
      backgroundColor: AppColors.primary,
    ),
  );
}
