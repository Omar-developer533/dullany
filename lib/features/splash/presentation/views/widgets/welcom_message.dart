

import 'package:dullany/core/utls/app_colors.dart';
import 'package:dullany/core/utls/app_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WelcomMessage extends StatelessWidget {
  const WelcomMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'we select the best for you'.tr(),
      style: AppStyles.body.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.white.withValues(alpha: 0.9),
      ),
    );
  }
}
