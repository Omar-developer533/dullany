import 'dart:developer';

import 'package:dullany/core/functions/custom_snack_bar.dart';
import 'package:dullany/core/functions/navigator.dart';
import 'package:dullany/core/router/app_router.dart';
import 'package:dullany/core/utls/app_colors.dart';
import 'package:dullany/core/utls/app_styles.dart';
import 'package:dullany/core/utls/validator.dart';
import 'package:dullany/core/widgets/custom_button.dart';
import 'package:dullany/features/auth/presentation/cuibt/register_user/register_user_cubit.dart';
import 'package:dullany/features/auth/presentation/views/widgets/custom_container_indicator.dart';
import 'package:dullany/features/auth/presentation/views/widgets/custom_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CreateAccountSection extends StatefulWidget {
  const CreateAccountSection({super.key});

  @override
  State<CreateAccountSection> createState() => _CreateAccountSectionState();
}

class _CreateAccountSectionState extends State<CreateAccountSection> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phonController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confitmPasswordController =
      TextEditingController();

  bool obscure = true;
  bool obscure1 = true;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterUserCubit, RegisterUserState>(
      listener: (context, state) {
        if (state is RegisterSucces) {
          customSnackBar(context, 'Succes create account');
          GoRouter.of(context).pop();
        } else if (state is RegisterFailure) {
          customSnackBar(context, state.errorMessage);
          log(state.errorMessage);
        }
      },
      builder: (context, state) {
        return Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: AppColors.background,
            ),
            child: Form(
              autovalidateMode: autovalidateMode,
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: 35),
                  Text(
                    'Create Account'.tr(),
                    style: AppStyles.heading.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 25),
                  CustomFormField(
                    validator: Validator.nameValidator,

                    hint: 'full name',
                    icon: Icons.person,
                    controller: nameController,
                  ),
                  SizedBox(height: 18),
                  CustomFormField(
                    validator: Validator.phonValidator,
                    textInputType: TextInputType.phone,
                    hint: 'phon number',
                    icon: Icons.phone,
                    controller: phonController,
                  ),
                  SizedBox(height: 18),
                  CustomFormField(
                    iconTap: () {
                      obscure = !obscure;
                      setState(() {});
                    },
                    validator: Validator.passwordValidator,
                    obscureText: obscure,
                    textInputType: TextInputType.visiblePassword,
                    controller: passwordController,
                    hint: 'password',
                    icon: obscure == true
                        ? Icons.visibility_off
                        : Icons.remove_red_eye_sharp,
                  ),
                  SizedBox(height: 18),
                  CustomFormField(
                    iconTap: () {
                      obscure1 = !obscure1;
                      setState(() {});
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'this field is required'.tr();
                      } else if (value != passwordController.text) {
                        return 'No Match'.tr();
                      } else {
                        return null;
                      }
                    },
                    obscureText: obscure1,
                    textInputType: TextInputType.visiblePassword,
                    controller: confitmPasswordController,
                    hint: 'confirm password',
                    icon: obscure1 == true
                        ? Icons.visibility_off
                        : Icons.remove_red_eye_sharp,
                  ),
                  SizedBox(height: 100),
                  state is RegisterLoading
                      ? CustomContainerIndicator()
                      : CustomButton(
                          name: 'Create Account',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              context.read<RegisterUserCubit>().registerUser(
                                phonController.text,
                                passwordController.text,
                              );
                              passwordController.clear();
                              phonController.clear();
                              confitmPasswordController.clear();
                              nameController.clear();

                              setState(() {
                                autovalidateMode = AutovalidateMode.disabled;
                                FocusScope.of(context).unfocus();
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
        );
      },
    );
  }
}
