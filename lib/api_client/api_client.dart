import 'package:dio/dio.dart';

class Api {
  final Dio _dio = Dio();

  Future<Response<T>> client<T>(
    RequestOptions options,
  ) async {
    try {
      final response = await _dio.request<T>(options.path,
          data: options.data,
          queryParameters: options.queryParameters,
          options: Options(
            method: options.method,
          ));
      return response;
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 401) {}
        if (e.response?.statusCode == 404) {}
        if (e.response!.statusCode! >= 500) {}
      }
      return Future.error(e);
    }
  }
}
