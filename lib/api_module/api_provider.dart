import 'package:get/get.dart';
import 'package:mvvm_getx/feature/sign_in/model/SignInResponse.dart';

abstract class ISignInProvider {
  Future<Response<SignInResponse>> requestForSignIn(String path);
}

class ApiProvider extends GetConnect implements ISignInProvider {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = '';
  }

  @override
  Future<Response<SignInResponse>> requestForSignIn(String path) => get(path);
}
