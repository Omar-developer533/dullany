import 'package:dullany/core/firebase/firebase_firestore_service.dart';
import 'package:dullany/core/functions/custom_snack_bar.dart';
import 'package:dullany/core/utls/app_colors.dart';
import 'package:dullany/core/utls/app_images.dart';
import 'package:dullany/core/utls/app_styles.dart';
import 'package:dullany/core/utls/validator.dart';
import 'package:dullany/core/widgets/custom_button.dart';
import 'package:dullany/features/auth/presentation/views/widgets/custom_container_indicator.dart';
import 'package:dullany/features/auth/presentation/views/widgets/custom_form_field.dart';
import 'package:dullany/features/control/presentation/manager/Category/category_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController desController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {
        if (state is AddCategoryFailer) {
          customSnackBar(context, state.errorMessage);
        } else if (state is AddCategorySucces) {
          customSnackBar(context, 'تمت الاضافة بنجاح');
          nameController.clear();
          desController.clear();
        }
      },
      builder: (context, state) => Column(
        children: [
          Row(
            children: [
              Icon(Icons.add_circle_outline_rounded, color: AppColors.primary),
              SizedBox(width: 5),
              Text('Add New Category'.tr(), style: AppStyles.style18Bold),
            ],
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.white,
              border: Border.all(color: AppColors.primary),
            ),
            child: Form(
              autovalidateMode: autovalidateMode,
              key: formKey,
              child: Column(
                children: [
                  CustomFormField(
                    validator: Validator.nameValidator,
                    controller: nameController,
                    borderColor: Colors.transparent,
                    filled: true,
                    fillColor: AppColors.fillTextField,
                    hint: 'Category Name',
                    icon: Icons.category,
                  ),
                  SizedBox(height: 16),
                  CustomFormField(
                    validator: Validator.nameValidator,
                    controller: desController,
                    borderColor: Colors.transparent,
                    filled: true,
                    fillColor: AppColors.fillTextField,
                    hint: 'Description',
                    icon: Icons.description,
                  ),
                  SizedBox(height: 16),
                  CustomFormField(
                    validator: Validator.nameValidator,
                    borderColor: Colors.transparent,
                    filled: true,
                    fillColor: AppColors.fillTextField,
                    hint: 'Image',
                    icon: Icons.image,
                  ),
                  SizedBox(height: 16),
                  state is AddCategoryLoaading
                      ? CustomContainerIndicator()
                      : CustomButton(
                          name: 'Add',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                autovalidateMode = AutovalidateMode.disabled;
                                FocusScope.of(context).unfocus();
                              });
                              context.read<CategoryCubit>().addCategory({
                                'Name': nameController.text,
                                'des': desController.text,
                                'image': Assets.assetsImagesMarket,
                              });
                            } else {
                              setState(() {
                                autovalidateMode = AutovalidateMode.always;
                              });
                            }
                          },
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
