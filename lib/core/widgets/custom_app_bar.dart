import 'package:dullany/core/utls/app_colors.dart';
import 'package:dullany/core/utls/app_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      titleSpacing: 3,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.menu, color: AppColors.primary),
      ),
      title: Text(
        maxLines: 1,
        title.tr(),
        style: AppStyles.heading.copyWith(
          color: AppColors.primary,
          fontSize: 25,
          fontWeight: FontWeight.w500,
          fontFamily: 'cairo',
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.primary,
              size: 28,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 55);
}
