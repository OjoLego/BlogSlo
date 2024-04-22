import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../util/constants.dart';

class AuthService {

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    final response = await http.post(
      Uri.parse(loginURL),
      body: {
        'email': email,
        'password': password,
      },
    );

    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> registerUser(
      String name, String email, String password) async {
    final response = await http.post(
      Uri.parse(registerURL),
      body: {
        'full_name': name,
        'email': email,
        'password': password,
      },
    );

    return json.decode(response.body);
  }
}
