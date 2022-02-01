import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mvvm_getx/feature/dashboard/binding.dart';
import 'package:mvvm_getx/feature/dashboard/view.dart';
import 'package:mvvm_getx/feature/sign_in/binding.dart';
import 'package:mvvm_getx/feature/sign_in/view.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SIGN_IN;

  static final routes = [
    GetPage(
      name: Routes.SIGN_IN,
      page: () => SignInWidget(),
      binding: SignInBinding(),
      children: [],
    ),
    GetPage(
      name: Routes.HOME,
      page: () => DashboardWidget(),
      binding: DashboardBinding(),
      children: [],
    ),
  ];
}
