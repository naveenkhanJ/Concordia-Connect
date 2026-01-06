import 'package:shared_preferences/shared_preferences.dart';

/// Singleton service to track user role (admin vs regular user)
class UserService {
  static final UserService _instance = UserService._internal();
  factory UserService() => _instance;
  UserService._internal();

  static const String _isAdminKey = 'is_admin';
  bool _isAdmin = false;

  bool get isAdmin => _isAdmin;

  /// Initialize the service by loading stored admin status
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _isAdmin = prefs.getBool(_isAdminKey) ?? false;
  }

  /// Set admin status and persist to storage
  Future<void> setIsAdmin(bool value) async {
    _isAdmin = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isAdminKey, value);
  }

  /// Reset user state (for logout)
  Future<void> reset() async {
    _isAdmin = false;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_isAdminKey);
  }
}
