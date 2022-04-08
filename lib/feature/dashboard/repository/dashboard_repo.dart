import 'package:mvvm_getx/api_module/api_provider.dart';
import 'package:mvvm_getx/feature/dashboard/model/post.dart';
import 'package:http/http.dart' as http;

class DashboardRepository {
  final ApiProvider apiProvider;

  DashboardRepository({required this.apiProvider});

  Future<List<Post>> getAllPost() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final List<Post> post = postFromJson(response.body);
      return post;
    } else {
      return Future.error("An error occurred");
    }
  }

  Future<List<Post>?> getAllPostWithProvider() async {
    final response = await apiProvider.getPost("https://jsonplaceholder.typicode.com/posts");

    if (response.statusCode == 200) {
     // final List<Post> post = postFromJson(response);
    //  final List<Post> post = response;
     // return post;
      return response.body;
    } else {
      return Future.error("An error occurred");
    }
  }
}
