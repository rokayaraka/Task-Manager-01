import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:task_manager_astad/Controller/auth_controller.dart';
import 'package:task_manager_astad/Data/Models/api_response.dart';

class ApiCaller {
  static final Logger _logger = Logger();

  static Future<ApiResponse> getRequest({ required String url }) async {
    try {
      _logRequest(url, null);
      Uri uri=Uri.parse(url);
      Response response= await get( uri,
      headers: {
          'Content-Type': 'application/json',
          'token':AuthController.accessToken??""
      }
      );
      _logRequest(url, jsonDecode(response.body));
      if(response.statusCode == 200){
        return ApiResponse(responseCode: response.statusCode, responseData:jsonDecode(response.body), isSuccess: true, errorMessage: '');
      }
      else{
        return ApiResponse(responseCode: response.statusCode, responseData: jsonDecode(response.body), isSuccess: false, errorMessage: "Request failed with status: ${response.statusCode}");
      }

    } catch (e) {
      return ApiResponse(responseCode: -1, responseData: null, isSuccess: false, errorMessage: e.toString());
    }
  }

  static Future<ApiResponse> postRequest({ required String url, required Map<String, dynamic> body }) async {
    try {
      _logRequest(url, null);
      Uri uri=Uri.parse(url);
      Response response= await post( uri,
      headers: {
          'Content-Type': 'application/json',
          "accept": "application/json",
          "token":AuthController.accessToken??""
      },
      body:  jsonEncode(body)
      );
       log("Response Status Code: ${response.statusCode}");
      _logRequest(url, jsonDecode(response.body));
     
      if(response.statusCode == 200|| response.statusCode == 201){
        return ApiResponse(responseCode: response.statusCode, responseData:jsonDecode(response.body), isSuccess: true, errorMessage: '');
      }
      else{
        return ApiResponse(responseCode: response.statusCode, responseData: jsonDecode(response.body), isSuccess: false, errorMessage: "Request failed with status: ${response.statusCode}");
      }

    } catch (e) {
      return ApiResponse(responseCode: -1, responseData: null, isSuccess: false, errorMessage: e.toString());
    }
  }

  static void _logRequest(String url, Map<String, dynamic>? body) {
    _logger.i(
      "URL => $url\n"
      "Body => ${body != null ? body.toString() : 'No Body'}",
    );
  }
}
