import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/login_model.dart';

abstract class LoginRemoteDataSource {
  Future<LoginModel> login(String username, String password);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  static const String baseUrl = 'https://dummyjson.com/auth/login';

  @override
  Future<LoginModel> login(String username, String password) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (response.statusCode == 200) {
      return LoginModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login: ${response.statusCode}');
    }
  }
}