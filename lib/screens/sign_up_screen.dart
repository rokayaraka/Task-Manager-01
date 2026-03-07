import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:task_manager_astad/utils/app_colors.dart';
import 'package:task_manager_astad/widgets/screen_background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _NewLoginScreenState();
}

class _NewLoginScreenState extends State<SignUpScreen> {
  void  _onTapSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Text('Join with Us', style: TextTheme.of(context).titleLarge),
                SizedBox(height: 25),
                TextFormField(decoration: InputDecoration(hintText: 'Email')),
                SizedBox(height: 10),
                TextFormField(
                 
                  decoration: InputDecoration(hintText: 'First Name'),
                ),
                SizedBox(height: 10),
                TextFormField(
                 
                  decoration: InputDecoration(hintText: 'Last Name'),
                ),
                SizedBox(height: 10),
                TextFormField(
                 
                  decoration: InputDecoration(hintText: 'Mobile'),
                ),
                 SizedBox(height: 10),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'Password'),
                ),
            
                FilledButton(
                  onPressed: () {},
                  child: Icon(Icons.arrow_circle_right_outlined),
                ),
                SizedBox(height: 35,),
                Center(
                  child: Column(
                    children: [
                      // TextButton(
                      //   onPressed: () {},
                      //   child: Text(
                      //     'Forget password?',
                      //     style: TextStyle(color: Colors.grey),
                      //   ),
                      // ),
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
      
    );
  }
}
