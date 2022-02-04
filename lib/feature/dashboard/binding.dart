import 'package:get/get.dart';
import 'package:mvvm_getx/api_module/api_provider.dart';
import 'package:mvvm_getx/feature/dashboard/repository/dashboard_repo.dart';

import 'logic.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiProvider>(() => ApiProvider());
    Get.lazyPut<DashboardRepository>(
            () => DashboardRepository(apiProvider: Get.find()));
    Get.lazyPut(() => DashboardController(repository: Get.find()));
  }
}
