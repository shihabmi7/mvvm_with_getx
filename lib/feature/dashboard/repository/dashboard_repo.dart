import 'package:mvvm_getx/api_module/api_provider.dart';
import 'package:mvvm_getx/feature/dashboard/model/post.dart';

class DashboardRepository {
  final ApiProvider apiProvider;

  DashboardRepository({required this.apiProvider});

  Future<List<Post>> getAllPost() async {
    final response = await apiProvider.getPost("https://jsonplaceholder.typicode.com/posts");
    //final List<Post> post = postFromJson(jsonString);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return postFromJson(response.bodyString!);
    }
  }
}
