import 'package:dullany/core/utls/app_colors.dart';
import 'package:dullany/core/utls/app_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.icon,
    this.onPressed,
  });
  final String title;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      elevation: 0,
      titleSpacing: 3,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.menu, color: AppColors.white),
      ),
      title: Text(
        maxLines: 1,
        title.tr(),
        style: AppStyles.heading.copyWith(
          color: AppColors.white,
          fontSize: 25,
          fontWeight: FontWeight.w500,
          fontFamily: 'cairo',
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(icon, color: AppColors.white, size: 28),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 60);
}
