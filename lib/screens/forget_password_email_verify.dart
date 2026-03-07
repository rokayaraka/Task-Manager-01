import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_astad/screens/new_login_screen.dart';

import 'package:task_manager_astad/utils/app_colors.dart';
import 'package:task_manager_astad/widgets/screen_background.dart';

class ForgetPasswordEmailVerify extends StatefulWidget {
  const ForgetPasswordEmailVerify({super.key});

  @override
  State<ForgetPasswordEmailVerify> createState() => _NewLoginScreenState();
}

class _NewLoginScreenState extends State<ForgetPasswordEmailVerify> {
  
   void  _onTapLogIn(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>NewLoginScreen()));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ScreenBackground(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 150),
                Text('Your Email Address', style: TextTheme.of(context).titleLarge),
                SizedBox(height: 25),
                TextFormField(decoration: InputDecoration(hintText: 'Email')),
                SizedBox(height: 10),
               
            
                FilledButton(
                  onPressed: () {},
                  child: Icon(Icons.arrow_circle_right_outlined),
                ),
                SizedBox(height: 35,),
                Center(
                  child: Column(
                    children: [
                      
                      RichText(
                        text: TextSpan(
                          text: "Have an account? ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(
                              text: 'Log In',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()..onTap=_onTapLogIn,
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
