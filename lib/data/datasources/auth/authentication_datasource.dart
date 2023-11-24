import 'package:dio/dio.dart';
import 'package:online_shop/data/datasources/auth/authentication_impl.dart';
import 'package:online_shop/di/di_shop.dart';
import 'package:online_shop/services/httpRequest/httpRequestimpl.dart';

class Authentication implements AuthenticationInterFace {
  final HttpRequestInterFace httpRequest = ServiceLocator.get();

  @override
  Future<void> register(String username, String password,
      String passwordConfirm, String path) async {
    final response = await httpRequest.post(path, {
      'username': username,
      'password': password,
      'passwordConfirm': passwordConfirm,
    });
  }

  @override
  Future<String> login(String username, String password, String path) async {
    Response response = await httpRequest.post(path, {
      'identity': username,
      'password': password,
    });

    if (response.statusCode == 200) {
      return response.data?['token'] ?? 'Auth Faild';
    }
    return '';
  }
}
