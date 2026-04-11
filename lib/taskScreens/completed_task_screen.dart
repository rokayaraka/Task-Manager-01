import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_astad/providers/task_provider.dart';
import 'package:task_manager_astad/widgets/taskCard.dart';
import 'package:task_manager_astad/widgets/tm_appbar.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask((){
      final provider = Provider.of<TaskProvider>(context,listen: false);
      provider.fetchTaskByStatus('Completed');
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TmAppbar(),
      body:  Consumer<TaskProvider>(
          builder: (context, taskProvider, _){
            return ListView.separated(
              itemCount: taskProvider.completeTask.length,
              itemBuilder: (context,index){
                return TaskCard(
                  taskModel: taskProvider.completeTask[index],
                  cardColor: Colors.green,
                  refreshParent: () {  },


                );
              },
              separatorBuilder: (context,index){
                return SizedBox(
                  height: 4,
                );
              },
            );
          }
      ),
    );
  }
}