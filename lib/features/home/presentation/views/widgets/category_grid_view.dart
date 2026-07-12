
import 'package:dullany/core/utls/app_images.dart';
import 'package:dullany/features/home/data/models/category_model.dart';
import 'package:dullany/features/home/presentation/views/widgets/category_card.dart';
import 'package:flutter/material.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 17,
        mainAxisSpacing: 16,
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      children: [
        CategoryCard(
          categoryModel: CategoryModel(
            image: Assets.assetsImagesDrinks,
            categoryName: 'Drinks',
            describtion: 'Natural and refreshing',
          ),
        ),
        CategoryCard(
          categoryModel: CategoryModel(
            image: Assets.assetsImagesMarket,
            categoryName: 'Market',
            describtion: 'Daily needs',
          ),
        ),
        CategoryCard(
          categoryModel: CategoryModel(
            image: Assets.assetsImagesResturant2,
            categoryName: 'Resturant',
            describtion: 'Delicious dishes',
          ),
        ),
      ],
    );
  }
}
