import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      path: 'assets/translation/',
      supportedLocales: [Locale('ar')],
      fallbackLocale: Locale('ar'),
      saveLocale: true,
      child: const Dullany(),
    ),
  );
}

class Dullany extends StatelessWidget {
  const Dullany({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
