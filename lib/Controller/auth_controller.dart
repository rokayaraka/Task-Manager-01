import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_astad/Data/Models/userModel.dart';

class AuthController {
  static final Logger _logger = Logger();
  static String _accessTokenKey = 'token';
  static String _userModelKey = 'user-data';

  static String? accessToken;
  static UserModel? userModel;

  static Future saveUserdata(UserModel model, String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accessTokenKey, token);
    await sharedPreferences.setString(_userModelKey, jsonEncode(model));
    accessToken = token;
    userModel = model;

    _logger.i(accessToken);
    _logger.i(model);
  }

  static Future getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_accessTokenKey);
    if (token != null) {
      accessToken = token;
      String? userData = sharedPreferences.getString(_userModelKey);
      userModel = UserModel.fromJson(jsonDecode(userData!));
    }

    _logger.i(token);
    _logger.i(userModel);
  }

  static Future<bool> isUserLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_accessTokenKey);
   return token!=null;
  }
}
