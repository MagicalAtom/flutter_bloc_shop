import 'package:dio/dio.dart';
import 'package:online_shop/di/di_shop.dart';
import 'package:online_shop/exception/HttpException.dart';
import 'package:online_shop/services/httpRequest/httpRequestimpl.dart';

class HttpRequest extends HttpRequestInterFace {
  final Dio I = ServiceLocator.get(); // get instance of Dio

  @override
  Future<dynamic> post(String path, Map<String, dynamic> data) async {
    try {
      Response response = await I.post(path, data: data);
      return response;
    } on DioException catch (e) {
      throw HttpExceptionHandle(
          statuscode: e.response?.statusCode,
          message: e.response?.data['message'],
          response: e.response);
    } catch (e) {
      throw HttpExceptionHandle(
        statuscode: 000,
        message: 'No',
      );
    }
  }

  @override
  Future<dynamic> get(String path,[queryParameters]) async {
    try {
      Response response = await I.get(path,queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      throw HttpExceptionHandle(
          statuscode: e.response?.statusCode,
          message: e.response?.data['message'],
          response: e.response);
    } catch (e) {
      throw HttpExceptionHandle(
        statuscode: 000,
        message: 'No',
      );
    }
  }
  

  // this only using pocketBase
  @override
  Map<String, String> setqueryParameters({filtername, filterValue}) {
      return {
        "filter": '$filtername' + '=' + '"$filterValue"'
    };
  }


}
