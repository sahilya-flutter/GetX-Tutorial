import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String tokenKey = 'auth_token';
  static const String emailKey = 'user_email';

  static Future<void> saveToken(String token) async {
    print("Saving token to storage");
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(tokenKey, token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(tokenKey);
    print(
        "Retrieved token from storage: ${token != null ? '[exists]' : 'null'}");
    return token;
  }

  static Future<void> saveEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(emailKey, email);
  }

  static Future<String?> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(emailKey);
  }

  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
