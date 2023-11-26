import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(baseUrl: "https://student.valuxapps.com/api/"));
  }

  static Future<Response?> get(
      {required String path, Map<String, dynamic>? query}) async {
    return await dio?.get(path, queryParameters: query);
  }

  static Future<Response?> post(
      {required String path,
      Map<String, dynamic>? query,
      required dynamic data}) async {
    return await dio?.post(path, queryParameters: query, data: data);
  }
}
