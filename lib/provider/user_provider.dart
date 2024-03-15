import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:whitemastery_machine_test/api_client/api_client.dart';
import 'package:whitemastery_machine_test/constants/api_config.dart';
import 'package:whitemastery_machine_test/models/user_model.dart';

enum AppState { loading, complete, error }

class UserProvider extends ChangeNotifier {
  UserProvider() {
    getUsers();
  }

  List<UserModel> userList = [];

  final _apiClient = Api();
  dynamic _data;
  String _errorMessage = '';
  AppState _state = AppState.loading;

  AppState get state => _state;

  String get errorMessage => _errorMessage;

  void getUsers() async {
    try {
      _state = AppState.loading;
      notifyListeners();
      var url = ApiConfig.baseUrl + ApiEndPoint.user;
      final response = await _apiClient.client<dynamic>(
        RequestOptions(method: 'GET', path: url),
      );
      response.data['data']
          .map((e) => userList.add(UserModel.fromJson(e)))
          .toList();
      _state = AppState.complete;
    } catch (error) {
      _errorMessage = error.toString();
      _state = AppState.error;
    } finally {
      notifyListeners();
    }
  }
}
