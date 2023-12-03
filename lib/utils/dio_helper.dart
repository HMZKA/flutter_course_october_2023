import 'package:dio/dio.dart';
import 'package:flutter_course_october/utils/storage.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
        BaseOptions(baseUrl: "https://student.valuxapps.com/api/", headers: {
      "lang": "en",
    }));
  }

  static Future<Response?> get(
      {required String path, Map<String, dynamic>? query}) async {
    return await dio?.get(path,
        queryParameters: query,
        options: Options(headers: {
          "Authorization": "${CacheHelper.getData(key: "token") ?? ''}"
        }));
  }

  static Future<Response?> post(
      {required String path,
      Map<String, dynamic>? query,
      required dynamic data}) async {
    return await dio?.post(path, queryParameters: query, data: data);
  }
}
