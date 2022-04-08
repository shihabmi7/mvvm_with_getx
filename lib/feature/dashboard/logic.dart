import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/feature/dashboard/model/post.dart';
import 'package:mvvm_getx/feature/dashboard/repository/dashboard_repo.dart';

class DashboardController extends GetxController with StateMixin<List<Post>> {
  final DashboardRepository repository;

  DashboardController({required this.repository});

  var _isLoading = false.obs;

  get isLoading => _isLoading;

  set isLoading(isLoading) {
    _isLoading = isLoading;
  }

  //List<Post>? postList;
  //late final todoList = <Post>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getPost();
    //getPostWithProvider();
  }

  @override
  void onClose() {}

  Future<void> getPost() async {
    isLoading(true);
    try {
      await repository
          .getAllPost()
          .then((value) => change(value, status: RxStatus.success()),
              onError: (error) {
        if (kDebugMode) {
          change(value, status: RxStatus.error());
          print(error);
        }
      });
    } finally {
      isLoading(false);
    }
  }

  Future<void> getPostWithProvider() async {
    isLoading(true);
    try {
      await repository
          .getAllPostWithProvider()
          .then((value) => change(value, status: RxStatus.success()),
              onError: (error) {
        if (kDebugMode) {
          change(value, status: RxStatus.error());
          print(error);
        }
      });
    } finally {
      isLoading(false);
    }
  }
}
