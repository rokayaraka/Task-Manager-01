import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_astad/screens/new_login_screen.dart';

import 'package:task_manager_astad/utils/app_colors.dart';
import 'package:task_manager_astad/widgets/screen_background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _NewLoginScreenState();
}

class _NewLoginScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Text('Join with Us', style: TextTheme.of(context).titleLarge),
                  SizedBox(height: 25),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(hintText: 'Email'),
                    validator: (value){
                      if(value==null|| value.isEmpty){
                        return 'Please Enter Valid Email';
                      }
                      else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _firstNameController,
                    decoration: InputDecoration(hintText: 'First Name'),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _lastNameController,
                    decoration: InputDecoration(hintText: 'Last Name'),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _mobileController,
                    decoration: InputDecoration(hintText: 'Mobile'),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(hintText: 'Password'),
                  ),
                  SizedBox(height: 10),
                  FilledButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate()){}
                    },
                    child: Icon(Icons.arrow_circle_right_outlined),
                  ),
                  SizedBox(height: 35),
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
        ),
      ),
    );
  }
}
