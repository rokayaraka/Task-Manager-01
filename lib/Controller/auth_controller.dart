import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_astad/Data/Models/userModel.dart';

class AuthController {
  static final Logger _logger = Logger();
  static final String _accessTokenKey = 'token';
  static final String _userModelKey = 'user-data';

  static String? accessToken;
  static UserModel? userModel;

  static Future saveUserdata(UserModel model, String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accessTokenKey, token);
    await sharedPreferences.setString(_userModelKey, jsonEncode(model.toJson()));
    accessToken = token;
    userModel = model;

    _logger.i(accessToken);
    _logger.i(model);
  }

  static Future getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_accessTokenKey);
    if (token == null) {
      accessToken = null;
      userModel = null;
      return;
    }

    try {
      accessToken = token;
      String? userData = sharedPreferences.getString(_userModelKey);
      if (userData == null || userData.isEmpty) {
        await cleanUserData();
        return;
      }

      final dynamic decoded = jsonDecode(userData);
      if (decoded is! Map<String, dynamic>) {
        await cleanUserData();
        return;
      }

      userModel = UserModel.fromJson(decoded);
    } catch (_) {
      await cleanUserData();
    }

    _logger.i(token);
    _logger.i(userModel);
  }

  static Future<bool> isUserLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_accessTokenKey);
    return token != null && userModel != null;
  }

  static Future<void> updateUserData(UserModel model) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_userModelKey, jsonEncode(model.toJson()));
    userModel = model;
  }

  static Future<void> cleanUserData([UserModel? model]) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(_accessTokenKey);
    await sharedPreferences.remove(_userModelKey);
    accessToken = null;
    userModel = null;
  }
}
