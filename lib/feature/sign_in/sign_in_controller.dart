import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/feature/sign_in/model/SignInResponse.dart';
import 'package:mvvm_getx/feature/sign_in/repository/sign_in_repository.dart';

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
    final isValid = logInFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    try {
      isLoading(true);
      logInFormKey.currentState!.save();
      signInRepository.getSignIn().then((data) {
        change(data, status: RxStatus.success());
      }, onError: (err) {
        change(null, status: RxStatus.error(err.toString()));
      });
    } finally {
      isLoading(false);
    }
  }
}
