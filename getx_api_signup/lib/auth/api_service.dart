import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://reqres.in/api";
  static const String apiKey = "reqres-free-v1";

  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    print("API Login - Email: $email");
    try {
      final uri = Uri.parse("$baseUrl/login?api_key=$apiKey");
      print("Making POST request to: $uri");

      // Important: For reqres.in, when using Content-Type: application/json,
      // we need to send the body as JSON string, not as a map
      final response = await http.post(
        uri,
        body: jsonEncode({'email': email, 'password': password}),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      print("Login response status: ${response.statusCode}");
      print("Login response body: ${response.body}");

      // For reqres.in test API, it will return a token only for specific test credentials:
      // email: eve.holt@reqres.in
      // password: cityslicka

      return {
        'statusCode': response.statusCode,
        'body': jsonDecode(response.body),
      };
    } catch (e) {
      print("Login API error: $e");
      return {
        'statusCode': 500,
        'body': {'error': e.toString()}
      };
    }
  }

  static Future<Map<String, dynamic>> getUserProfile(String token) async {
    try {
      final uri = Uri.parse("$baseUrl/users/2?api_key=$apiKey");
      print("Getting user profile from: $uri");

      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        },
      );

      print("Profile response status: ${response.statusCode}");
      print("Profile response body: ${response.body}");

      return {
        'statusCode': response.statusCode,
        'body': jsonDecode(response.body)
      };
    } catch (e) {
      print("Get profile API error: $e");
      return {
        'statusCode': 500,
        'body': {'error': e.toString()}
      };
    }
  }

  static Future<Map<String, dynamic>> register(
      String email, String password) async {
    print("API Register - Email: $email");
    try {
      final uri = Uri.parse("$baseUrl/register?api_key=$apiKey");
      print("Making POST request to: $uri");

      // For reqres.in, when using Content-Type: application/json,
      // we need to send the body as JSON string
      final response = await http.post(
        uri,
        body: jsonEncode({'email': email, 'password': password}),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      print("Register response status: ${response.statusCode}");
      print("Register response body: ${response.body}");

      // For reqres.in test API, it will successfully register only:
      // email: eve.holt@reqres.in
      // password: pistol

      return {
        'statusCode': response.statusCode,
        'body': jsonDecode(response.body),
      };
    } catch (e) {
      print("Register API error: $e");
      return {
        'statusCode': 500,
        'body': {'error': e.toString()}
      };
    }
  }
}