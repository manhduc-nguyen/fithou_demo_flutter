import 'package:fithou_demo/network/request/login_request.dart';
import 'package:fithou_demo/network/response/login_data.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://6435172a83a30bc9ad57ad7a.mockapi.io/api/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('v1/login')
  Future<LoginData> login(@Body() LoginRequest request);
}
