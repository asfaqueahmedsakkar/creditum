import 'package:creditum/app/modules/add_transaction/bindings/add_transaction_binding.dart';
import 'package:creditum/app/modules/add_transaction/views/add_transaction_view.dart';
import 'package:get/get.dart';

import '../modules/add_accont/bindings/add_accont_binding.dart';
import '../modules/add_accont/views/add_accont_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.ADD_ACCONT,
      page: () => const AddAccontView(),
      binding: AddAccontBinding(),
    ),
    GetPage(
      name: _Paths.ADD_TRANSACTION,
      page: () => const AddTransactionView(),
      binding: AddTransactionBinding(),
    ),
  ];
}
