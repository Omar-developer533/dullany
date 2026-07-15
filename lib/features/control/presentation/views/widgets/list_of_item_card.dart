
import 'package:dullany/features/control/presentation/views/widgets/item_card.dart';
import 'package:flutter/material.dart';

class ListOfItemCard extends StatelessWidget {
  const ListOfItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: ItemCard(),
        );
      },
    );
  }
}
