import 'package:flutter/material.dart';

import 'package:task_manager_astad/screens/splash_screen.dart';
import 'package:task_manager_astad/utils/app_colors.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),

          bodyLarge: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          bodySmall: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade600,
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          
          filled: true,
          fillColor: Colors.white,
          hintStyle: TextStyle(color: Colors.grey,fontSize: 20,),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),

        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(

            backgroundColor: AppColors.primaryColor,
            fixedSize: Size.fromWidth(double.maxFinite),
            padding: EdgeInsets.symmetric(vertical: 12,),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(8),
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
