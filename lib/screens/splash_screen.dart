import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager_astad/Controller/auth_controller.dart';
import 'package:task_manager_astad/screens/main_nav_screen.dart';

import 'package:task_manager_astad/screens/new_login_screen.dart';
import 'package:task_manager_astad/utils/assets_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    moveToNextScreen();
  }

  Future<void> moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 5));
    bool isLoggIn = false;

    try {
      await AuthController.getUserData();
      isLoggIn = await AuthController.isUserLoggedIn();
    } catch (_) {
      isLoggIn = false;
    }

    if (!mounted) {
      return;
    }

    if (isLoggIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainNavScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NewLoginScreen()),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(AssetsPath.backgroundSvg, fit: BoxFit.cover),
          Center(child: SvgPicture.asset(AssetsPath.logo)),
        ],
      ),
    );
  }
}
