import 'package:http/http.dart' as http;
import 'package:mvvm_getx/feature/sign_in/model/SignInResponse.dart';

class ApiService {
  static var client = http.Client();

  static Future<SignInResponse> signInRequest() async {
    /*var apiResponse =
        await client.get(Uri.parse('https://example.com/whatsit/create'));
    var jsonString = apiResponse.body;
    return signInResponseFromJson(jsonString);*/

    SignInResponse response =
        await SignInResponse(message: 'Welcome', code: 200);
    return response;
  }
}
