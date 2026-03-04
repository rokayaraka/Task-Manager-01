import 'package:flutter/material.dart';
import 'package:task_manager_astad/screens/splash_screen.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        
        textTheme: TextTheme(
          
          bodyLarge: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
           

          ),
          bodyMedium: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            
          ),
          bodySmall: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
             color: Colors.grey.shade600,
          ),
        ),

      ),
     debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}