import 'package:dullany/core/utls/app_colors.dart';

import 'package:dullany/core/widgets/custom_app_bar.dart';
import 'package:dullany/features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:dullany/features/home/presentation/views/widgets/item_crad.dart';
import 'package:flutter/material.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomAppBar(title: 'المطاعم', icon: Icons.arrow_forward),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    CustomSearchBar(),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              SliverList.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ItemCard(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
