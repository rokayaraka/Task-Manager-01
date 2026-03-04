import 'package:flutter/material.dart';
import 'package:flutter_avif/flutter_avif.dart';
import 'package:task_manager_astad/screens/logIn_screen.dart';
import 'package:task_manager_astad/utils/assets_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void>moveToNextScreen()async{
   await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LogInScreen()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // moveToNextScreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AvifImage.asset(AssetsPath.backgroundSvg),
          Center(child: Image.asset(AssetsPath.logo)),
        ],
      ),
      
    );
  }
}