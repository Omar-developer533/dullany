
import 'package:dullany/features/home/presentation/views/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 5,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.65,

        mainAxisSpacing: 16,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return ProductCard();
      },
    );
  }
}
