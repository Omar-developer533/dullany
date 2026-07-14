import 'package:dullany/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ControlView extends StatelessWidget {
  const ControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: ''),);
  }
}