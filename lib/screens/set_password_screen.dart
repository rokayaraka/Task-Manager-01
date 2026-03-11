import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_astad/screens/new_login_screen.dart';
//import 'package:task_manager_astad/screens/otp_verification.dart';

import 'package:task_manager_astad/utils/app_colors.dart';
import 'package:task_manager_astad/widgets/screen_background.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _NewLoginScreenState();
}

class _NewLoginScreenState extends State<SetPasswordScreen> {
  void _onTapLogIn() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewLoginScreen()),
    );
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
                'Set Password',
                style: TextTheme.of(context).titleLarge,
              ),
              SizedBox(height: 10,),
              Text('Password should be more than 6 letters',style: TextTheme.of(context).bodySmall,),
              SizedBox(height: 25),
              TextFormField(decoration: InputDecoration(hintText: 'Password')),
              SizedBox(height: 10),
              TextFormField(decoration: InputDecoration(hintText: 'Confirm Password')),
              SizedBox(height: 10),
              FilledButton(
                onPressed: (){},
                child: Text('Confirm'),
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
