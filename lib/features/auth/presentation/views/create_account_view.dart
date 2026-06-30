import 'package:dullany/core/utls/app_colors.dart';

import 'package:dullany/features/auth/presentation/views/widgets/create_account_section.dart';
import 'package:flutter/material.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

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
                  SizedBox(height: 45),
                  Icon(Icons.people_alt, size: 45, color: AppColors.white),

                  CreateAccountSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

