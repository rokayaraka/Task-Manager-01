import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_astad/providers/task_provider.dart';
import 'package:task_manager_astad/widgets/taskCard.dart';
import 'package:task_manager_astad/widgets/tm_appbar.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.microtask((){
      final provider = Provider.of<TaskProvider>(context,listen: false);
      provider.fetchTaskByStatus('Progress');
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TmAppbar(),
      body: Consumer<TaskProvider>(
    builder: (context, taskProvider, _){
          return ListView.separated(
            itemCount: taskProvider.progressTask.length,
              itemBuilder: (context,index){
              return TaskCard(
                taskModel: taskProvider.progressTask[index],
                cardColor: Colors.purple,
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