import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_service;

class DioService {
  Dio dio = Dio();

  Future<dynamic> getMethod({required String? url}) async {
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

  Future<dynamic> postMethod(
      {required Map<String, dynamic> map, required String? url}) async {
    try {
      dio.options.headers["content-type"] = "application/json";
      var result = await dio.post(
        url!,
        data: dio_service.FormData.fromMap(map),
        options: Options(responseType: ResponseType.json, method: "POST"),
      );
      log("#Result PostMethod $result");
      return result;
    } catch (e) {
      log("#Catch Post Method => $e");
    }
  }
}
