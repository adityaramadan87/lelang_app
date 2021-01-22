import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lelang_app/api/intercept/ApiInterceptor.dart';
import 'package:lelang_app/api/resnreq/login/LoginRequest.dart';
import 'package:lelang_app/api/resnreq/login/LoginResponse.dart';
import 'package:lelang_app/constant/Constant.dart';

class RestApi {
  final dio = createDio();

  static Dio createDio() {
    Dio dio = Dio(BaseOptions(
        baseUrl: Constant.url.BASE_URL,
        connectTimeout: 50000,
        receiveTimeout: 30000
    ));

    setInterceptors(dio);
    return dio;
  }

  static void setInterceptors(Dio dio){
    dio.interceptors.clear();
    dio.interceptors.add(ApiInterceptor());
  }

  Future<LoginResponse> getLoginResponse(LoginRequest loginRequest) async {
    print(loginRequest);
    Response response = await dio.post(Constant.url.LOGIN,
      data: new FormData.fromMap(loginRequest.toJson()),
      options: Options(
        validateStatus: (status) {
          return status < 500;
        }
      ));
    
    return LoginResponse.fromJson(response.data);
  }
}