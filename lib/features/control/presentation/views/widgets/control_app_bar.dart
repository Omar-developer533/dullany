import 'package:dullany/core/utls/app_colors.dart';
import 'package:dullany/core/utls/app_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ControlAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ControlAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actionsPadding: EdgeInsets.only(left: 12),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_forward, color: AppColors.white),
        ),
      ],
      elevation: 0,
      titleSpacing: 3,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.menu),
        color: AppColors.white,
      ),
      backgroundColor: AppColors.primary,
      title: Text(
        'control panel'.tr(),
        style: AppStyles.heading.copyWith(
          color: AppColors.white,
          fontSize: 25,
          fontWeight: FontWeight.w500,
          fontFamily: 'cairo',
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 55);
}
