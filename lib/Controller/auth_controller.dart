import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_astad/Data/Models/userModel.dart';

class AuthController {
  static String _accessTokenKey = 'token';
  static String _userModelKey = 'user-data';

  static String? accessToken;
  static UserModel? userModel;

  static Future saveUserdata(UserModel model,String token)async{
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    sharedPreferences.setString(_accessTokenKey, token);
    sharedPreferences.setString(_userModelKey, jsonEncode(model));
    accessToken=token;
    userModel=model;
  }

}