import 'package:get/get.dart';
import 'package:mvvm_getx/api_module/api_provider.dart';
import 'package:mvvm_getx/feature/sign_in/repository/sign_in_repository.dart';

import 'sign_in_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiProvider>(() => ApiProvider());
    Get.lazyPut<SignInRepository>(
        () => SignInRepository(apiProvider: Get.find()));
    Get.lazyPut(() => SignInController(signInRepository: Get.find()));
  }
}
