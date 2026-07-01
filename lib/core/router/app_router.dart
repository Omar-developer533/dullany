import 'package:dullany/features/auth/presentation/views/create_account_view.dart';
import 'package:dullany/features/auth/presentation/views/log_in_view.dart';
import 'package:dullany/features/home/presentation/views/categories_view.dart';
import 'package:dullany/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

const kLoginView = '/logInView';
const kCreateAccount = '/createAccount';
const kCategoriesView = '/categoriesView';
final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => SplashView()),
    GoRoute(path: kLoginView, builder: (context, state) => LogInView()),
    GoRoute(
      path: kCreateAccount,
      builder: (context, state) => CreateAccountView(),
    ),
    GoRoute(
      path: kCategoriesView,
      builder: (context, state) => CategoriesView(),
    ),
  ],
);
