import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager_astad/utils/assets_path.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SvgPicture.asset(AssetsPath.backgroundSvg, fit: BoxFit.cover),
            Center(
              child:  Column(
                  spacing: 15,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                        'Get Started with',
                        style: TextTheme.of(context).bodyLarge,
                      ),
                    
                    CustomInputWidget(
                      emailController: _emailController,
                      hintText: 'Email',
                    ),
                
                    CustomInputWidget(
                      emailController: _passwordController,
                      hintText: 'Password',
                    ),
                
                    CustomElevatedButton(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Forget Password?',style: TextTheme.of(context).bodySmall,),
                        Row(
                          children: [
                            Text("Don't have account",),
                            TextButton(onPressed: (){}, child: Text('Sign up'))
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(5)
          ),
        ),

        child: Stack(
          children: [Icon(Icons.circle_outlined), Icon(Icons.navigate_next)],
        ),
      ),
    );
  }
}

class CustomInputWidget extends StatelessWidget {
  CustomInputWidget({
    super.key,
    required TextEditingController emailController,
    this.Controller,
    required this.hintText,
  });

  final TextEditingController? Controller;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
     width: 300,
      child: TextField(
        controller: Controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,

          enabled: true,
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          hintStyle: TextTheme.of(context).bodySmall,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
