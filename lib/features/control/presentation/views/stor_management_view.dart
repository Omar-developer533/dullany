import 'package:dullany/core/utls/app_colors.dart';

import 'package:dullany/core/utls/app_styles.dart';
import 'package:dullany/core/widgets/custom_app_bar.dart';

import 'package:dullany/features/control/presentation/views/widgets/add_product.dart';
import 'package:dullany/features/control/presentation/views/widgets/control_product_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class StoreManagementView extends StatelessWidget {
  const StoreManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomAppBar(
          title: 'Store Management',
          icon: Icons.arrow_forward,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 32),
              AddProduct(),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('My Products'.tr(), style: AppStyles.style18Bold),
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                ],
              ),
              ControlProductCard(),
              SizedBox(height: 15),
              ControlProductCard(),
            ],
          ),
        ),
      ),
    );
  }
}
