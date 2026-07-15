import 'package:dullany/core/functions/navigator.dart';
import 'package:dullany/core/router/app_router.dart';
import 'package:dullany/core/utls/app_colors.dart';

import 'package:dullany/core/widgets/custom_app_bar.dart';

import 'package:dullany/features/home/presentation/views/widgets/category_grid_view.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Categories', icon: Icons.logout),
        backgroundColor: AppColors.background,

        body: Padding(
          padding: const EdgeInsets.only(top: 15, left: 16, right: 16),
          child: CategoryGridView(),
        ),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(200),
          ),
          backgroundColor: AppColors.primary,
          onPressed: () {
            customNavigate(context, kControlView);
          },
        ),
      ),
    );
  }
}
