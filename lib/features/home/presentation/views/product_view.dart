import 'package:dullany/core/utls/app_images.dart';

import 'package:dullany/features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:dullany/features/home/presentation/views/widgets/item_inf.dart';
import 'package:dullany/features/home/presentation/views/widgets/logo.dart';

import 'package:dullany/features/home/presentation/views/widgets/product_list.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Image.asset(
                        Assets.assetsImagesRes2,
                        height: 250,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(height: 200),
                      CustomSearchBar(hintText: 'اختر وجبتك المفضلة...'),
                      SizedBox(height: 15),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 10,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.favorite_border),
                        Spacer(),
                        Icon(Icons.share_outlined),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                  Positioned(left: 16, right: 16, top: 208, child: ItemInfo()),
                  Positioned(left: 260, right: 50, top: 165, child: Logo()),
                ],
              ),
            ),
            ProductList(),
          ],
        ),
      ),
    );
  }
}
