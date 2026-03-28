import 'package:flutter/material.dart';
import 'package:task_manager_astad/widgets/taskCard.dart';
import 'package:task_manager_astad/widgets/tm_appbar.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TmAppbar(),
      body: ListView.separated(
        itemBuilder: (context,index){
          return TaskCard(
            
          );

        }, 
        separatorBuilder: (context,index){
          return SizedBox(height: 4,);
        }, 
        itemCount: 10,
        ),
    );
  }
}