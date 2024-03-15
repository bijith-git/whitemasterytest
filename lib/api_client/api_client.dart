import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();

  Future<Response> getUsers() async {
    try {
      return await _dio.get('https://reqres.in/api/users');
    } catch (error) {
      throw Exception('Failed to load users');
    }
  }
}
