import 'package:dio/dio.dart';
import 'package:shop_app/constant/common.dart';

final dio = Dio(BaseOptions(baseUrl: baseUrl, connectTimeout: const Duration(seconds: 10), contentType: "application/json",));

class ApiResponse<T>{
    late int code;
    late String message;
    late T? data;
}