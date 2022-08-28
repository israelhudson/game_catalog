import 'dart:developer' as dev;

import 'package:dio/dio.dart';

class InterceptorAuth extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //final local = Modular.get<LocalToken>();
    options.headers["Client-ID"] = "6s26alivw3doh75e5td9gtrhfg1kww";
    options.headers["Authorization"] = "Bearer rxd7d75ip2t1wu55xt3eo8b7yi8nr3";
    options.baseUrl = "https://api.igdb.com/v4/";
    //dev.log("${local.token}", name: "onRequest Token");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    dev.log("${response.data}", name: "onResponse");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    dev.log("${err.type.index}", name: "onError");
    super.onError(err, handler);
  }
}
