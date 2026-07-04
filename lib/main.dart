import 'package:dullany/core/cache/cache_helper.dart';
import 'package:dullany/core/router/app_router.dart';
import 'package:dullany/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  await CacheHelper.init();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      path: 'assets/translation',
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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
