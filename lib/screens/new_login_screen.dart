import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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

    Future<void> _signIn() async {
    Map<String, dynamic> requestBody = {
      "email": _emailController.text,

      "password": _passwordController.text,
    };
    setState(() {
      isLoading = true;
    });
    final ApiResponse response = await ApiCaller.PostRequest(
      URL: Urls.LogInUrl,
      body: requestBody,
    );
    setState(() {
      isLoading = false;
    });

    if (response.isSuccess) {
      UserModel model = UserModel.fromJson(response.responseData['data']);
      String accessToken = response.responseData['token'];
      AuthController.saveUserdata(model, accessToken);
      

     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainNavScreen()));
      ScaffoldMessenger.of(
        // ignore: use_build_context_synchronously
        context,
      ).showSnackBar(SnackBar(content: Text('Sign In Successful.')));
    } else {
      ScaffoldMessenger.of(
        // ignore: use_build_context_synchronously
        context,
      ).showSnackBar(SnackBar(content: Text(response.responseData['data'])));
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
