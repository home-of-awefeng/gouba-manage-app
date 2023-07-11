import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shop_app/constant/common.dart';

part 'request.g.dart';

final dio = Dio(BaseOptions(baseUrl: baseUrl, connectTimeout: const Duration(seconds: 10), contentType: "application/json"));

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T>{
    int code;
    String message;
    T? data;
    ApiResponse(this.data, this.message, this.code);

    factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$ApiResponseFromJson(json, fromJsonT);
    Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$ApiResponseToJson(this, toJsonT);
}