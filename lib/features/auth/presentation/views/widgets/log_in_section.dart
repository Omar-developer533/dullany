import 'package:dullany/core/cache/cache_helper.dart';
import 'package:dullany/core/functions/custom_snack_bar.dart';
import 'package:dullany/core/functions/navigator.dart';
import 'package:dullany/core/router/app_router.dart';
import 'package:dullany/core/utls/app_colors.dart';
import 'package:dullany/core/utls/app_styles.dart';
import 'package:dullany/core/utls/validator.dart';
import 'package:dullany/core/widgets/custom_button.dart';
import 'package:dullany/features/auth/presentation/cuibt/login/login_cubit.dart';
import 'package:dullany/features/auth/presentation/views/widgets/custom_container_indicator.dart';
import 'package:dullany/features/auth/presentation/views/widgets/custom_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInSection extends StatefulWidget {
  const LogInSection({super.key});

  @override
  State<LogInSection> createState() => _LogInSectionState();
}

class _LogInSectionState extends State<LogInSection> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phonController = TextEditingController();
  bool obscure = true;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
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
                'login'.tr(),
                style: AppStyles.heading.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
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
              SizedBox(height: 100),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    passwordController.clear();
                    phonController.clear();
                    customReplacementNavigate(context, kCategoriesView);
                    CacheHelper.saveData(key: 'isLoggedIn', value: true);
                  } else if (state is LoginFailure) {
                    customSnackBar(context, state.errorMessage);
                  }
                },
                builder: (context, state) => state is LoginLoading
                    ? CustomContainerIndicator()
                    : CustomButton(
                        name: 'Enter',
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            context.read<LoginCubit>().login(
                              phonController.text,
                              passwordController.text,
                            );

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

                  InkWell(
                    onTap: () {
                      customNavigate(context, kCreateAccount);
                    },
                    child: Text(
                      'Create Account'.tr(),
                      style: AppStyles.body.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
