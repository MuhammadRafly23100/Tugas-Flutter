import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static const String keyUsername = 'username';
  static const String keyPassword = 'password'; // Add this line
  static const String keyIsLoggedIn = 'is_logged_in';

  static Future<void> saveCredentials(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyUsername, username);
    await prefs.setString(keyPassword, password); // Save password
    await prefs.setBool(keyIsLoggedIn, true);
  }

  static Future<void> saveUsername(String username) async { // Keep this for backward compatibility or specific use cases
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyUsername, username);
    await prefs.setBool(keyIsLoggedIn, true);
  }

  static Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyUsername);
  }

  static Future<String?> getPassword() async { // Add this method
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyPassword);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keyIsLoggedIn) ?? false;
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
