import 'package:mvvm_getx/api_module/api_provider.dart';
import 'package:mvvm_getx/feature/sign_in/model/SignInResponse.dart';

class SignInRepository {
  final ApiProvider apiProvider;

  SignInRepository({required this.apiProvider});

  Future<SignInResponse?> getSignIn() async {
    final response = await apiProvider.requestForSignIn("");

    if (response.status.hasError) {
      return Future.error(response.status);
    } else {
      return response.body;
    }
  }
}
