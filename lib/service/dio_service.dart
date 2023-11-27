import 'dart:developer';
import 'package:dio/dio.dart';

class DioService {
  Dio dio = Dio();

  Future<dynamic> getMethod({String? url}) async {
    try {
      dio.options.headers["content-type"] = "application/json";
      var result = await dio.get(url!,
          options: Options(
            responseType: ResponseType.json,
            method: "GET",
          ));
      log("#Result GetMethod $result");
      return result;
    } catch (e) {
      log("#Catch Get Method => $e");
    }
  }
}
