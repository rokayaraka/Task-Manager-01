import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
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

    super.initState();
   moveToNextScreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(AssetsPath.backgroundSvg,fit: BoxFit.cover,),
          Center(child: SvgPicture.asset(AssetsPath.logo)),
        ],
      ),
      
    );
  }
}