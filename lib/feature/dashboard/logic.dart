import 'package:get/get.dart';
import 'package:mvvm_getx/feature/dashboard/model/post.dart';
import 'package:mvvm_getx/feature/dashboard/repository/dashboard_repo.dart';

class DashboardController extends GetxController
    with StateMixin<List<Post>> {
  final DashboardRepository repository;

  DashboardController({required this.repository});

  var _isLoading = false.obs;

  get isLoading => _isLoading;

  set isLoading(isLoading) {
    _isLoading = isLoading;
  }

  List<Post>? postList;

  @override
  void onInit() {
    super.onInit();
  }
  @override
  void onReady() {
    super.onReady();
    getPost();
  }

  @override
  void onClose() {

  }

  Future<void> getPost() async {
    isLoading(true);
    try {
      var result = await repository.getAllPost().then(
          (value) => (data) {
                // postList = data;
                change(data, status: RxStatus.success());
              }, onError: (error) {
        change(null, status: RxStatus.error(error.toString()));
      });

      // Future.delayed(const Duration(seconds: 1), () {
      // });

    } finally {
      isLoading(false);
    }
  }
}
