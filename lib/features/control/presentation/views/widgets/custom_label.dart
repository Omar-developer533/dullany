
import 'package:dullany/core/utls/app_styles.dart';
import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  const CustomLabel({super.key, required this.labelName});
  final String labelName;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(labelName, style: AppStyles.style16Regular),
    );
  }
}