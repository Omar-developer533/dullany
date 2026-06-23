import 'package:dullany/core/utls/app_colors.dart';
import 'package:dullany/features/splash/presentation/views/widgets/custom_logo.dart';
import 'package:dullany/features/splash/presentation/views/widgets/welcom_message.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [CustomLogo(), SizedBox(height: 20), WelcomMessage()],
          ),
        ),
      ),
    );
  }
}
