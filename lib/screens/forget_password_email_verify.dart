import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_astad/Data/Models/api_response.dart';
import 'package:task_manager_astad/Data/services/api_caller.dart';
import 'package:task_manager_astad/screens/new_login_screen.dart';
import 'package:task_manager_astad/screens/otp_verification.dart';

import 'package:task_manager_astad/utils/app_colors.dart';
import 'package:task_manager_astad/utils/urls.dart';
import 'package:task_manager_astad/widgets/screen_background.dart';

class ForgetPasswordEmailVerify extends StatefulWidget {
  const ForgetPasswordEmailVerify({super.key});

  @override
  State<ForgetPasswordEmailVerify> createState() => _NewLoginScreenState();
}

class _NewLoginScreenState extends State<ForgetPasswordEmailVerify> {
  TextEditingController _emailController = TextEditingController();
  void _onTapLogIn() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewLoginScreen()),
    );
  }
   void _onTapVerifyOtp() async {
     if(_emailController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter your email')));
      return;
     }

     ApiResponse response = await ApiCaller.getRequest(URL: Urls.emailVerificationURL(_emailController.text));
    if(response.isSuccess){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('OTP sent to your email')));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OtpVerification(email: _emailController.text,)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed to send OTP. Please try again.')));
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 150),
              Text(
                'Your Email Address',
                style: TextTheme.of(context).titleLarge,
              ),
              SizedBox(height: 25),
              TextFormField(
                controller: _emailController,
                cursorHeight: 20,
                cursorWidth: 3,
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(hintText: 'Email')
              ),
              SizedBox(height: 10),

              FilledButton(
                onPressed: _onTapVerifyOtp,
                child: Icon(Icons.arrow_circle_right_outlined),
              ),
              SizedBox(height: 35),
              Center(
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Have an account? ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'Log In',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = _onTapLogIn,
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
    );
  }
}
