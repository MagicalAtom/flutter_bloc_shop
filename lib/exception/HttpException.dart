import 'package:dio/dio.dart';

class HttpExceptionHandle implements Exception {


int? statuscode;
String? message;
Response<dynamic>? response;


  HttpExceptionHandle({
    required this.statuscode,
    required this.message,
     this.response,
  });


}
