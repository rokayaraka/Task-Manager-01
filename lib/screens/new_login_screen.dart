import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:task_manager_astad/Controller/auth_controller.dart';
import 'package:task_manager_astad/Data/Models/api_response.dart';
import 'package:task_manager_astad/Data/Models/userModel.dart';
import 'package:task_manager_astad/Data/services/api_caller.dart';
import 'package:task_manager_astad/screens/forget_password_email_verify.dart';
import 'package:task_manager_astad/screens/main_nav_screen.dart';
import 'package:task_manager_astad/screens/sign_up_screen.dart';
import 'package:task_manager_astad/utils/app_colors.dart';
import 'package:task_manager_astad/utils/urls.dart';
import 'package:task_manager_astad/widgets/screen_background.dart';

class NewLoginScreen extends StatefulWidget {
  const NewLoginScreen({super.key});

  @override
  State<NewLoginScreen> createState() => _NewLoginScreenState();
}

class _NewLoginScreenState extends State<NewLoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  final Logger _logger = Logger();

    Future<void> _signIn() async {
    Map<String, dynamic> requestBody = {
      "email": _emailController.text,
      "password": _passwordController.text,
    };
    setState(() {
      isLoading = true;
    });
    
    _logger.i('=== LOGIN ATTEMPT ===');
    _logger.i('Email: ${_emailController.text}');
    _logger.i('URL: ${Urls.LoginUrl}');
    
    final ApiResponse response = await ApiCaller.PostRequest(
      URL: Urls.LoginUrl,
      body: requestBody, 
    );
    
    _logger.i('=== LOGIN RESPONSE ===');
    _logger.i('Status Code: ${response.responseCode}');
    _logger.i('Is Success: ${response.isSuccess}');
    _logger.i('Response Data: ${response.responseData}');
    _logger.i('Error Message: ${response.errorMsg}');
    
    setState(() {
      isLoading = false;
    });

    if (response.isSuccess) {
      try {
        if (response.responseData == null) {
          _logger.e('Response data is null');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Invalid response from server. Please try again.'),
            ),
          );
          
          return;
        }

        final dynamic userData = response.responseData['data'];
        final dynamic token = response.responseData['token'];

        _logger.i('User Data: $userData');
        _logger.i('Token: $token');

        if (userData == null || token == null) {
          _logger.e('Missing user data or token in response');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Invalid login response. Please try again.'),
            ),
          );
          return;
        }

        UserModel model = UserModel.fromJson(userData);
        String accessToken = token.toString();
        await AuthController.saveUserData(model, accessToken);
     log(response.responseCode.toString());
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainNavScreen()),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sign In Successful.')),
        );
      } catch (e) {
        _logger.e('Exception during login: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed: ${e.toString()}')),
        );
      }
    } else {
      String errorMsg = 'Login failed. Please try again.';
      try {
        if (response.errorMsg != null && response.errorMsg!.isNotEmpty) {
          errorMsg = response.errorMsg!;
        } else if (response.responseData is Map) {
          if (response.responseData['message'] != null) {
            errorMsg = response.responseData['message'].toString();
          } else if (response.responseData['data'] != null) {
            errorMsg = response.responseData['data'].toString();
          } else if (response.responseData['error'] != null) {
            errorMsg = response.responseData['error'].toString();
          }
        }
      } catch (e) {
        _logger.e('Error parsing error message: $e');
      }
      
      _logger.e('Login Error: $errorMsg');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errorMsg)));
    }
  }

  void  _onTapSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));

  }



  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:ScreenBackground(
        
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 150),
                  Text('Get Started With', style: TextTheme.of(context).titleLarge),
                  SizedBox(height: 25),
                  TextFormField(
                    controller: _emailController,
                    cursorHeight: 20,
                    style: TextStyle(fontSize: 16),
                cursorWidth: 3,
                    decoration: InputDecoration(hintText: 'Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Valid Email';
                      } else {
                        return null;
                      }
                    },
                    ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _passwordController,
                    cursorHeight: 20,
                cursorWidth: 3,
                style: TextStyle(fontSize: 16),
                    obscureText: true,
                    decoration: InputDecoration(hintText: 'Password'),
                     validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Valid Password';
                        } else {
                          return null;
                        }
                      },
                  ),
                  SizedBox(height: 10,),
                  FilledButton(
                    onPressed:  () {
                      if(_formKey.currentState!.validate()){
                        _signIn();
                      }
                    
                  },
                    child: Icon(Icons.arrow_circle_right_outlined),
                  ),
                  SizedBox(height: 35,),
                  Center(
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordEmailVerify()));
                        },
                          child: Text(
                            'Forget password?',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()..onTap=_onTapSignUp,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      
    );
  }
}
