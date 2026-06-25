import 'package:dullany/core/utls/app_colors.dart';
import 'package:dullany/core/utls/app_images.dart';
import 'package:dullany/core/utls/app_styles.dart';
import 'package:dullany/core/utls/validator.dart';
import 'package:dullany/core/widgets/custom_button.dart';
import 'package:dullany/features/auth/presentation/views/widgets/custom_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phonController = TextEditingController();
  bool obscure = true;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Column(
          children: [
            SizedBox(height: 40),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.assetsImagesOnBoarding2),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Expanded(
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
                        'login'.tr(),
                        style: AppStyles.body.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 44,
                        ),
                      ),
                      SizedBox(height: 25),
                      CustomFormField(
                        validator: Validator.phonValidator,
                        textInputType: TextInputType.phone,
                        hint: 'phon number',
                        icon: Icons.phone,
                        controller: phonController,
                      ),
                      SizedBox(height: 18),
                      CustomFormField(
                        iconTap: () {},
                        validator: Validator.passwordValidator,
                        obscureText: true,
                        textInputType: TextInputType.visiblePassword,
                        controller: passwordController,
                        hint: 'password',
                        icon: Icons.remove_red_eye_sharp,
                      ),
                      SizedBox(height: 100),
                      CustomButton(
                        name: 'Enter',
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            passwordController.clear();
                            phonController.clear();

                            setState(() {
                              autovalidateMode = AutovalidateMode.disabled;
                            });
                          } else {
                            setState(() {
                              autovalidateMode = AutovalidateMode.always;
                            });
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'New User?'.tr(),
                            style: AppStyles.body.copyWith(
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Text(
                            'Create Account'.tr(),
                            style: AppStyles.body.copyWith(
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
