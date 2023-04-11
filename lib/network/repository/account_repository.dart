import 'package:dio/dio.dart';
import 'package:fithou_demo/network/request/login_request.dart';
import 'package:fithou_demo/network/rest_client.dart';

class AccountRepository {
  late final RestClient _restClient;

  AccountRepository() {
    final dio = Dio();
    dio.options.headers["Demo-Header"] = "demo header";
    _restClient = RestClient(dio);
  }

  Future<bool> login(String userName, String password) async {
    try {
      final result = await _restClient.login(LoginRequest(userName, password));
      return result.token?.isNotEmpty ?? false;
    } catch (exception) {
      return false;
    }
  }
}
