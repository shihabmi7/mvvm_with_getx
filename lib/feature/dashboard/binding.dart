import 'package:get/get.dart';

import 'logic.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardLogic());
  }
}
