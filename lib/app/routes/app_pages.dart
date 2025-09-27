import 'package:get/get.dart';

import '../../Presentation/home/bindings/home_binding.dart';
import '../../Presentation/home/views/home_view.dart';
import '../../Presentation/second_splash/bindings/second_splash_binding.dart';
import '../../Presentation/second_splash/views/second_splash_view.dart';
import '../../Presentation/splash/bindings/splash_binding.dart';
import '../../Presentation/splash/views/splash_view.dart';
import '../../Presentation/third_splash/bindings/third_splash_binding.dart';
import '../../Presentation/third_splash/views/third_splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.SECOND_SPLASH,
      page: () => const SecondSplashView(),
      binding: SecondSplashBinding(),
    ),
    GetPage(
      name: _Paths.THIRD_SPLASH,
      page: () => const ThirdSplashView(),
      binding: ThirdSplashBinding(),
    ),
  ];
}
