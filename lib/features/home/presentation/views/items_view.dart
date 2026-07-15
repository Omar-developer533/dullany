import 'package:dullany/core/utls/app_colors.dart';
import 'package:dullany/core/widgets/custom_app_bar.dart';
import 'package:dullany/features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomAppBar(title: 'المطاعم', icon: Icons.arrow_forward),
        body: Column(
          children: [
            SizedBox(height: 10),
            CustomSearchBar(),
          ],
        ),
      ),
    );
  }
}
