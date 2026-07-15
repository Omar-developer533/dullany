import 'package:dullany/core/utls/app_colors.dart';
import 'package:dullany/core/utls/app_styles.dart';
import 'package:dullany/core/widgets/custom_button.dart';
import 'package:dullany/features/auth/presentation/views/widgets/custom_form_field.dart';
import 'package:dullany/features/control/presentation/views/widgets/control_app_bar.dart';
import 'package:dullany/features/control/presentation/views/widgets/list_of_item_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ControlView extends StatelessWidget {
  const ControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: ControlAppBar(),
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 32),
                    Row(
                      children: [
                        Icon(
                          Icons.add_circle_outline_rounded,
                          color: AppColors.primary,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Add New Category'.tr(),
                          style: AppStyles.style18Bold,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 24,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.white,
                        border: Border.all(color: AppColors.primary),
                      ),
                      child: Column(
                        children: [
                          CustomFormField(
                            borderColor: Colors.transparent,
                            filled: true,
                            fillColor: AppColors.fillTextField,
                            hint: 'Category Name',
                            icon: Icons.category,
                          ),
                          SizedBox(height: 16),
                          CustomFormField(
                            borderColor: Colors.transparent,
                            filled: true,
                            fillColor: AppColors.fillTextField,
                            hint: 'Description',
                            icon: Icons.description,
                          ),
                          SizedBox(height: 16),
                          CustomFormField(
                            borderColor: Colors.transparent,
                            filled: true,
                            fillColor: AppColors.fillTextField,
                            hint: 'Image',
                            icon: Icons.image,
                          ),
                          SizedBox(height: 16),
                          CustomButton(name: 'Add'),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: [
                        Icon(Icons.store, color: AppColors.primary),
                        SizedBox(width: 5),
                        Text(
                          'Manager Items:'.tr(),
                          style: AppStyles.style18Bold,
                        ),
                        Spacer(),
                        Text(
                          'New Item'.tr(),
                          style: AppStyles.body.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            ListOfItemCard(),
          ],
        ),
      ),
    );
  }
}
