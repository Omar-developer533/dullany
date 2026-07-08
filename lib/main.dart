import 'package:dullany/core/cache/cache_helper.dart';
import 'package:dullany/core/firebase/firebase_auth_service.dart';
import 'package:dullany/core/router/app_router.dart';
import 'package:dullany/features/auth/data/repos/auth_repo_impl.dart';
import 'package:dullany/features/auth/presentation/cuibt/register_user/register_user_cubit.dart';
import 'package:dullany/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
    return BlocProvider(
      create: (context) => RegisterUserCubit(
        AuthRepoImpl(firebaseAuthService: FirebaseAuthService()),
      ),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
