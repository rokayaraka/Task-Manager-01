import 'package:flutter/material.dart';
import 'package:task_manager_astad/widgets/taskCount_by_status.dart';
import 'package:task_manager_astad/widgets/tm_appbar.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TmAppbar(

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return TaskCountByStatus(title: 'New', count: 10);
              
                }, 
                separatorBuilder: (context,index){
                  return SizedBox(width: 4,);
                }, itemCount: 4,),
            ),
          ),

        ],
      ),
    );
  }
}