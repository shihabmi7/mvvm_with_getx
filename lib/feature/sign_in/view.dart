import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/shared/label_widget.dart';

import 'sign_in_controller.dart';

class SignInWidget extends GetView<SignInController> {

  @override
  Widget build(BuildContext context) {
    //final controller = Get.find<SignInController>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: controller.logInFormKey,
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 62,
                    ),
                    CustomLabel(text: "Welcome to MVVM"),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.emailController,
                      onSaved: (value) {
                        controller.email = value!;
                      },
                      validator: (value) {
                        return controller.validateEmail(value!);
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: 'Password'),
                      obscureText: true,
                      controller: controller.passwordController,
                      onSaved: (value) {
                        controller.password = value!;
                      },
                      validator: (value) {
                        return controller.validatePassword(value!);
                      },
                    ),
                    ElevatedButton(
                        onPressed: () {
                          controller.signIn();
                        },
                        child: const Text('Log In')),
                  ],
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}
