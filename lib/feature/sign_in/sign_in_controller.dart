import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/feature/sign_in/model/SignInResponse.dart';
import 'package:mvvm_getx/feature/sign_in/repository/sign_in_repository.dart';
import 'package:mvvm_getx/routes/app_routes.dart';

class SignInController extends GetxController with StateMixin<SignInResponse> {
  final GlobalKey<FormState> logInFormKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  SignInController({required this.signInRepository});

  final SignInRepository signInRepository;

  var email = '';
  var password = '';

  var _isLoading = false.obs;

  get isLoading => _isLoading;

  set isLoading(isLoading) {
    _isLoading = isLoading;
  }

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  String? validateEmail(String email) {
    if (!GetUtils.isEmail(email)) {
      return "Please give a valid email";
    }
    return null;
  }

  String? validatePassword(String password) {
    if (password.length < 6) {
      return "Please provide at least 6 character password";
    }
    return null;
  }

  void signIn() async {
    Get.toNamed(Routes.HOME);

    /*final isValid = logInFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    try {
      isLoading(true);
      logInFormKey.currentState!.save();

      Future.delayed(const Duration(seconds: 1), () {
        signInRepository.getSignIn().then((data) {
          change(data, status: RxStatus.success());
          isLoading(false);
          Get.toNamed(Routes.HOME);
        }, onError: (err) {
          change(null, status: RxStatus.error(err.toString()));
          isLoading(false);
        });
      });


    } finally {
      //isLoading(false);
    }*/
  }
}
