import 'package:dullany/core/utls/app_colors.dart';
import 'package:dullany/features/auth/presentation/views/widgets/image_section.dart';

import 'package:dullany/features/auth/presentation/views/widgets/log_in_section.dart';
import 'package:flutter/material.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  SizedBox(height: 40),
                  ImageSection(),
                  LogInSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
